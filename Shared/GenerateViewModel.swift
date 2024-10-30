	//
	//  GenerateViewModel.swift
	//  Fischr
	//
	//  Created by Cheuk Hei So on 27/10/2024.
	//

import Foundation
import CoreData
import SwiftUI
import WidgetKit

class GenerateViewModel: ObservableObject {
	
	let container: NSPersistentContainer
	@Published var storedGeneration: [GenerateEntity] = []
	@Published var last10Gen: [GenerateEntity] = []
	@Published var favGen: [GenerateEntity] = []
    
	
		// MARK: - Initialiser
	init() {
		container = NSPersistentContainer(name: "Fischr")

		if let storeURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.com.yourname.Fischr")?.appendingPathComponent("Fischr.sqlite") {
			let storeDescription = NSPersistentStoreDescription(url: storeURL)
			container.persistentStoreDescriptions = [storeDescription]
		}

		container.loadPersistentStores { (description, error) in
			if let error = error {
				print("ERROR: \(error.localizedDescription)")
			}
		}
	}
	
		// MARK: - New Generation
    
    func generateNewRandomPosition() {
        // Generate a new random position ID
        let newPositionID = Int.random(in: 0..<Positions.allPositions.count)
        let newPosition = String(newPositionID)
        
        // Create a new GenerateEntity and save it to Core Data
        let entity = GenerateEntity(context: container.viewContext)
        entity.positionGenerated = newPosition
        entity.isFavourite = false
        entity.timestamp = Date()
        
        // Save to Core Data
        saveData()
        
        // Save to UserDefaults for the widget
        let defaults = UserDefaults(suiteName: "group.com.yourname.Fischr")
        defaults?.set(newPosition, forKey: "latestPositionID")
        defaults?.set(false, forKey: "latestIsFavourite")
        
        // Reload the widget timeline to reflect changes
        WidgetCenter.shared.reloadAllTimelines()
    }

	
		// MARK: - Add New Generation
	func add(newGenerate: String, isFavourite: Bool, date: Date) {
		let newGeneration = GenerateEntity(context: container.viewContext)
		newGeneration.positionGenerated = newGenerate
		newGeneration.isFavourite = isFavourite
		newGeneration.timestamp = date
		
		saveData()
	}
    
		// MARK: - Delete Data
	func deleteData(indexSet: IndexSet) {
		indexSet.forEach { index in
			let entity = storedGeneration[index]
			container.viewContext.delete(entity)
		}
		saveData()
	}
	
		// MARK: - Save Data
	private func saveData() {
		do {
			try container.viewContext.save()
			fetchCoreData() // Refresh the stored data after saving.
		} catch let error {
			print("ERROR: \(error.localizedDescription)")
		}
	}
	
		// MARK: - Fetch Core Data
	private func fetchCoreData() {
		let request = NSFetchRequest<GenerateEntity>(entityName: "GenerateEntity")
		
		do {
			storedGeneration = try container.viewContext.fetch(request)
		} catch let error {
			print("ERROR: Fetch failed \(error.localizedDescription)")
		}
	}
	
		// MARK: - Fetch Last 10 Generations
	func checkLast10() {
		let lastGen = storedGeneration.sorted {
			($0.timestamp ?? Date()) > ($1.timestamp ?? Date())
		}
		self.last10Gen = Array(lastGen.prefix(10))
	}
	
		// MARK: - Fetch Favourite Generations
	func checkFav() {
		self.favGen = storedGeneration.filter { $0.isFavourite }
	}
	
		// MARK: - Update Entity
	func updateObj(for entity: GenerateEntity, isFavourite: Bool) {
		entity.isFavourite = isFavourite
		saveData()
        
        // Update UserDefaults if this is the latest position
        if entity == fetchLatestPosition() {
            let defaults = UserDefaults(suiteName: "group.com.yourname.Fischr")
            defaults?.set(entity.isFavourite, forKey: "latestIsFavourite")
        }
	}
	
	func fetchLatestPosition() -> GenerateEntity? {
		let request = NSFetchRequest<GenerateEntity>(entityName: "GenerateEntity")
		request.sortDescriptors = [NSSortDescriptor(key: "timestamp", ascending: false)]
		request.fetchLimit = 1

		do {
			return try container.viewContext.fetch(request).first
		} catch {
			print("ERROR: Failed to fetch latest position - \(error.localizedDescription)")
			return nil
		}
	}
	
}

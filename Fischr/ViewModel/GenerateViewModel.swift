	//
	//  GenerateViewModel.swift
	//  Fischr
	//
	//  Created by Cheuk Hei So on 27/10/2024.
	//

import Foundation
import CoreData

class GenerateViewModel: ObservableObject{
	
	let container: NSPersistentContainer
	@Published var storedGeneration: [GenerateEntity] = []
	@Published var last10Gen: [GenerateEntity] = []
	@Published var favGen: [GenerateEntity] = []
	
	
	
	init(){
		container = NSPersistentContainer(name: "Fischr")
		container.loadPersistentStores{(description, error) in
			if let error = error {
				print("ERROR: \(error)")
			}
		}
		
		fetchCoreData()
	}
	
	
	func add(newGenerate: String, isFavourite: Bool, date: Date){
		
		let newGeneration = GenerateEntity(context: container.viewContext)
		
		newGeneration.isFavourite = isFavourite
		newGeneration.positionGenerated = newGenerate
		newGeneration.timestamp = date
		
		saveData()
		
	}
	
	
	
	func deleteData(indexSet: IndexSet){
		guard let index = indexSet.first else{return}
		let entity = storedGeneration[index]
		container.viewContext.delete(entity)
		saveData()
	}
	
	
	func saveData(){
		
		do{
			try container.viewContext.save()
			fetchCoreData()
		}
		catch let error{
			
			print("ERROR: \(error)")
			
		}
		
	}
	
	func fetchCoreData(){
		
		let request = NSFetchRequest<GenerateEntity>(entityName: "GenerateEntity")
		
		do{
			storedGeneration = try container.viewContext.fetch(request)
		}
		catch let error{
			print("ERROR: Fetch fail \(error)")
		}
	}
	
	func checkLast10(){
			//sort history generation
		let lastGen = storedGeneration/*.sorted(by: { $0.timestamp ?? Date() > Date.now})*/
		self.last10Gen = Array(lastGen.prefix(10))
		
	}
	
	func checkFav(){
		
		let allFavGen = storedGeneration.filter({$0.isFavourite})
		self.favGen = allFavGen
		
	}
	
	func UpdateObj(nomeVecchio:String,nomeNuovo: String, descrizione:String, img: Data, url: String) {
		let context = fetchCoreData()
		let fetchRequest =
		NSFetchRequest<NSManagedObject>(entityName: "GenerateEntity")
		fetchRequest.returnsObjectsAsFaults = false
		fetchRequest.predicate = NSPredicate(format:"nomeEvento == %@",nomeVecchio)
		let result = try? context.fetch(fetchRequest)
		if result?.count == 1 {
			let dic = result![0]
			dic.setValue(nomeNuovo, forKey: "nomeEvento")
			dic.setValue(descrizione, forKey: "descrizioneEvento")
			dic.setValue(img, forKey: "imagineEvento")
			dic.setValue(url, forKey: "urlEvento")
			do {
				try saveData()
				print("saved!")
			} catch {
				print(error.localizedDescription)
			}
		}
	}
	
}

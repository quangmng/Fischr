//
//  RandomisePositionIntent.swift
//  Fischr
//
//  Created by Wendy Zhou on 30/10/2024.
//

import AppIntents
import CoreData

struct RandomizePositionIntent: AppIntent {
	static var title: LocalizedStringResource = "Randomize Position"

	func perform() async throws -> some IntentResult {
		// Logic to randomize the position and save to Core Data
		let viewModel = GenerateViewModel()
		viewModel.generateNewRandomPosition()
		
		return .result()
	}
}

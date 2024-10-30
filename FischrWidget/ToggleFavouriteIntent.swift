//
//  ToggleFavouriteIntent.swift
//  Fischr
//
//  Created by Wendy Zhou on 30/10/2024.
//

import AppIntents
import CoreData

struct ToggleFavoriteIntent: AppIntent {
	static var title: LocalizedStringResource = "Toggle Favorite"

	func perform() async throws -> some IntentResult {
		let viewModel = GenerateViewModel()

		// Fetch the latest position and toggle its favorite status
		if let latestPosition = viewModel.fetchLatestPosition() {
			viewModel.updateObj(for: latestPosition, isFavourite: !latestPosition.isFavourite)
		}

		return .result()
	}
}

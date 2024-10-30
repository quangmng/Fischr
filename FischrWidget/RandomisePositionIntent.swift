//
//  RandomisePositionIntent.swift
//  Fischr
//
//  Created by Wendy Zhou on 30/10/2024.
//

import AppIntents
import WidgetKit

struct RandomisePositionIntent: AppIntent {
    static var title: LocalizedStringResource = "Randomise Position"
    static var description = IntentDescription("Randomise a new Chess960 position.")

    func perform() async throws -> some IntentResult {
        let viewModel = GenerateViewModel()
        viewModel.generateNewRandomPosition()

        WidgetCenter.shared.reloadAllTimelines()

        return .result()
    }
}


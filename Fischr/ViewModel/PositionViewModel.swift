	//
	//  PositionViewModel.swift
	//  Fischr
	//
	//  Created by Wendy Zhou on 29/10/2024.
	//

import Foundation
import SwiftUI

class PositionViewModel: ObservableObject {
    @Published var currentPosition: String  = ""
    @Published var positionID: Int = Positions.initialPosition
    @Published var container: [String] = []
    @Published var vPosition: [String] = [] // Change to [String]
    
    init() {
        generateNewPosition()
    }
    
    func generateNewPosition() {
        let id = Int.random(in: 0..<Positions.allPositions.count)
        self.currentPosition = String(id)
        self.positionID = id
        separateChar(posID: id)
    }
    
    func generateNewPositionOnInput(posID: String) {
        let id = posID
        self.currentPosition = id
        self.positionID = Int(id) ?? 0
        separateChar(posID: Int(id) ?? 0)
    }
    
    func separateChar(posID: Int) {
        let positionString = Positions.allPositions[posID]
        self.container = positionString.map { String($0) }
        textToImage()
    }
    
    func textToImage() {
        self.vPosition = container.map { imageName(for: $0) }
    }
    
    func imageName(for character: String) -> String {
        // Map each character to its corresponding image name
        switch character {
        case "B": return "B"
        case "Q": return "Q"
        case "N": return "N"
        case "R": return "R"
        case "K": return "K"
        default: return "unknown"
        }
    }
}




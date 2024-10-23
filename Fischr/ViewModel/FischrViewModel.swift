//
//  FischrViewModel.swift
//  Fischr
//
//  Created by Quang Minh Nguyen on 23/10/2024.
//

import Foundation

class Chess960ViewModel: ObservableObject {
    @Published var generatedPosition: String = ""
    
    func generatePosition(n: Int) -> String {
        var backrank: [Character] = Array(repeating: " ", count: 8)
        
        let knightPos: [(Int, Int)] = [
            (0, 1), (0, 2), (0, 3), (0, 4),
            (1, 2), (1, 3), (1, 4), (2, 3),
            (2, 4), (3, 4)
        ]
        
        let range = Array(0..<8)
        var buffer: [Int]
        
        let n2 = n / 4
        let b1 = n % 4
        let n3 = n2 / 4
        let b2 = n2 % 4
        let n4 = n3 / 6
        let q = n3 % 6
        
        // Place bishops
        backrank[2 * b1 + 1] = "B"
        backrank[2 * b2] = "B"
        
        // Place queen
        buffer = range.filter { backrank[$0] == " " }
        backrank[buffer[q]] = "Q"
        
        // Place knights
        buffer = range.filter { backrank[$0] == " " }
        backrank[buffer[knightPos[n4].0]] = "N"
        backrank[buffer[knightPos[n4].1]] = "N"
        
        // Place rooks and king
        buffer = range.filter { backrank[$0] == " " }
        backrank[buffer[0]] = "R"
        backrank[buffer[1]] = "K"
        backrank[buffer[2]] = "R"
        
        return String(backrank)
    }
    
    func generateRandomPosition() {
        let posNo = Int.random(in: 0..<960)
        generatedPosition = generatePosition(n: posNo)
    }
    
    func generatePositionFromInput(_ input: String) {
        if let posNo = Int(input), posNo >= 0 && posNo < 960 {
            generatedPosition = generatePosition(n: posNo)
        } else if input.lowercased() == "random" {
            generateRandomPosition()
        } else {
            generatedPosition = "Invalid input"
        }
    }
}

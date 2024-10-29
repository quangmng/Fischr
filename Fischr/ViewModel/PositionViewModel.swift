//
//  PositionViewModel.swift
//  Fischr
//
//  Created by Wendy Zhou on 29/10/2024.
//

import Foundation

class PositionViewModel: ObservableObject {
	
	@Published var position: [String]
	
	init(position: [String]) {
		self.position = position
	}
	
	func regeneratePosition() {
		position = generateChess960Position() // Assign a new random position
	}

	func generateChess960Position() -> [String] {
		var squares = Array(repeating: "", count: 8)

		// Place two bishops on opposite-colored squares
		let bishop1 = Int.random(in: 0..<4) * 2
		var bishop2 = Int.random(in: 0..<4) * 2 + 1
		while bishop2 == bishop1 + 1 { // Ensure different columns
			bishop2 = Int.random(in: 0..<4) * 2 + 1
		}
		squares[bishop1] = "B"
		squares[bishop2] = "B"

		// Place the queen
		var available = squares.indices.filter { squares[$0].isEmpty }
		squares[available.randomElement()!] = "Q"

		// Place two knights
		available = squares.indices.filter { squares[$0].isEmpty }
		squares[available.remove(at: Int.random(in: 0..<available.count))] = "N"
		squares[available.remove(at: Int.random(in: 0..<available.count))] = "N"

		// Place the king between two rooks (R_K_R pattern)
		available = squares.indices.filter { squares[$0].isEmpty }
		available.sort()
		squares[available[0]] = "R"
		squares[available[1]] = "K"
		squares[available[2]] = "R"

		return squares
	}

	func calculateChess960ID(from position: [String]) -> Int {
			// A mock calculation for now; real logic would involve encoding bishops, rooks, king, etc.
		var hash = 0
		
			// Example encoding: Convert pieces to numeric values and sum them
		for (index, piece) in position.enumerated() {
			hash += pieceValue(piece) * (index + 1)
		}
		
			// Ensure the result is within 1 to 960 range
		return (hash % 960) + 1
	}
	
	func pieceValue(_ piece: String) -> Int {
		switch piece {
			case "R": return 5  // Rook
			case "N": return 3  // Knight
			case "B": return 3  // Bishop
			case "Q": return 9  // Queen
			case "K": return 10 // King
			default: return 1   // Pawn or empty (default)
		}
	}
}

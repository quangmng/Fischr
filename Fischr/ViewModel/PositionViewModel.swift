	//
	//  PositionViewModel.swift
	//  Fischr
	//
	//  Created by Wendy Zhou on 29/10/2024.
	//

import Foundation
import SwiftUICore

class PositionViewModel: ObservableObject {
	
	@Published var position: [String]
	@Published var vPosition:[Image]
	
	init(position: [String], vPosition: [Image]) {
		self.position = position
		self.vPosition = vPosition
	}
	
		/// Regenerate a new random Chess960 position
	func regeneratePosition() {
		position = generateChess960Position()
		let id = calculateChess960ID(from: position)
		print("New Position Generated: \(position), ID: \(calculateChess960ID(from: position))")
		textToImage()
	}
	
		/// Generate a valid Chess960 position according to rules
	func generateChess960Position() -> [String] {
		var squares = Array(repeating: "", count: 8)
		
			// 1. Place two bishops on opposite-colored squares
		let bishop1 = Int.random(in: 0..<4) * 2    // First bishop on a light square (0, 2, 4, 6)
		var bishop2 = Int.random(in: 0..<4) * 2 + 1 // Second bishop on a dark square (1, 3, 5, 7)
		while bishop2 == bishop1 + 1 {              // Ensure they don’t occupy adjacent columns
			bishop2 = Int.random(in: 0..<4) * 2 + 1
		}
		squares[bishop1] = "B"
		squares[bishop2] = "B"
		
			// 2. Place the queen randomly in an empty square
		var available = squares.indices.filter { squares[$0].isEmpty }
		squares[available.randomElement()!] = "Q"
		
			// 3. Place two knights in two empty squares
		available = squares.indices.filter { squares[$0].isEmpty }
		squares[available.remove(at: Int.random(in: 0..<available.count))] = "N"
		squares[available.remove(at: Int.random(in: 0..<available.count))] = "N"
		
			// 4. Place the king between two rooks (R_K_R pattern)
		available = squares.indices.filter { squares[$0].isEmpty }
		available.sort() // Sort the remaining indices to ensure R_K_R pattern is valid
		squares[available[0]] = "R"
		squares[available[1]] = "K"
		squares[available[2]] = "R"
		
		return squares
	}
	
		/// Calculate a unique Chess960 ID for a given position
	func calculateChess960ID(from position: [String]) -> Int {
		// Validate the position length
		guard position.count == 8 else { return -1 }

		// 1. Find the bishop positions and encode them into a unique bishop ID (0 to 15)
		let bishop1Index = position.firstIndex(of: "B")!
		let bishop2Index = position.lastIndex(of: "B")!
		let bishopID = (bishop1Index / 2) * 4 + (bishop2Index / 2)

		// 2. Find the remaining pieces: Queen, Knights, Rooks, and King
		var remainingPieces = position
			.enumerated()
			.filter { $0.element != "B" }
			.sorted(by: { $0.offset < $1.offset }) // Keep original order
			.map { $0.element }

		// Extract the queen's position from the remaining pieces
		let queenIndex = remainingPieces.firstIndex(of: "Q")!

		// Remove the queen from the list to handle the remaining pattern
		remainingPieces.remove(at: queenIndex)

		// 3. Encode the remaining pieces (R, K, N) into a unique pattern ID
		let remainingID = encodeRemainingPieces(remainingPieces)

		// 4. Combine the bishop ID, queen index, and remaining piece pattern into the final ID
		return bishopID * 96 + queenIndex * 16 + remainingID
	}

		/// Helper function to encode remaining pieces into a unique pattern ID
	private func encodeRemainingPieces(_ pieces: [String]) -> Int {
			// Assign each piece type a unique value for encoding
		let pieceMap: [String: Int] = ["K": 0, "R": 1, "Q": 2, "N": 3]
		
			// Sort the pieces in lexicographic order and convert them to numbers
		let encodedValues = pieces.compactMap { pieceMap[$0] }.sorted()
		
			// Use the encoded values to calculate a unique pattern ID
		var patternID = 0
		for (index, value) in encodedValues.enumerated() {
			patternID += value * Int(pow(4.0, Double(index))) // Base-4 encoding
		}
		return patternID
	}
	
		/// Map pieces to numeric values for simpler calculations (e.g., hash or score)
	func pieceValue(_ piece: String) -> Int {
		switch piece {
			case "R": return 5  // Rook
			case "N": return 3  // Knight
			case "B": return 3  // Bishop
			case "Q": return 9  // Queen
			case "K": return 10 // King
			default: return 1   // Pawn or empty
		}
	}
	
	func textToImage() -> [Image]{
		
		var imageArray = [Image]()
		
		for i in position{
		
			imageArray.append(Image("\(i)"))
			
		}
		self.vPosition = imageArray
		return vPosition
	}
}

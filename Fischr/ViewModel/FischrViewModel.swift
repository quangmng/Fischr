	//
	//  FischrViewModel.swift
	//  Fischr
	//
	//  Created by Quang Minh Nguyen on 23/10/2024.
	//
	// This file is going to generate a valid Chess960 position

import Foundation

/*
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
 */

func generateChess960Position() -> [String] {
	var squares = Array(repeating: "", count: 8) // Empty 8x1 array for ranks
	
	// 1. Place the bishops on opposite color squares
	let bishop1 = Int.random(in: 0..<4) * 2 // Bishop on a dark square
	var bishop2 = Int.random(in: 0..<4) * 2 + 1 // Bishop on a light square
	while bishop2 == bishop1 + 1 { // Avoid collision
		bishop2 = Int.random(in: 0..<4) * 2 + 1
	}
	squares[bishop1] = "B"
	squares[bishop2] = "B"
	
	// 2. Place the queen in a random empty position
	var available = squares.indices.filter { squares[$0].isEmpty }
	squares[available.randomElement()!] = "Q"
	
	// 3. Place the knights in two remaining random positions
	available = squares.indices.filter { squares[$0].isEmpty }
	let knight1 = available.randomElement()!
	squares[knight1] = "N"
	available.removeAll { $0 == knight1 }
	squares[available.randomElement()!] = "N"
	
	// 4. Place the two rooks and the king in the remaining positions (R_K_R pattern)
	available = squares.indices.filter { squares[$0].isEmpty }
	available.sort()
	squares[available[0]] = "R"
	squares[available[1]] = "K"
	squares[available[2]] = "R"
	
	return squares
}

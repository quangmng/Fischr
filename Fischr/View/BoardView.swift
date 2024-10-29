//
//  BoardView.swift
//  Fischr
//
//  Created by Wendy Zhou on 29/10/2024.
//

import SwiftUI

struct BoardView: View {
	let pieces: [String] // Holds the generated 960 position
	
	var body: some View {
		HStack(spacing: 4) {
			ForEach(0..<pieces.count, id: \.self) { index in
				Text(pieces[index])
					.frame(width: 44, height: 44)
					.background(Color.gray.opacity(0.3))
					.cornerRadius(6)
					.font(.largeTitle)
			}
		}
		.padding()
	}
}


#Preview {
	BoardView(pieces: ["R", "N", "B", "Q", "K", "B", "N", "R"]) // Mock Chess960 position
}

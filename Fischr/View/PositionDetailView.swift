	//
	//  PositionDetailView.swift
	//  Fischr
	//
	//  Created by Wendy Zhou on 28/10/2024.
	//
	// This file shows the details with the generated result

import SwiftUI
import UIKit

struct PositionDetailView: View {
	
	@State private var isFavourite: Bool = false
	@State private var isSharing: Bool = false
	@State private var selectedOption = "Text"
	let options = ["Text","Visual"]
	let position: [String]
	private var positionID: Int {
		calculateChess960ID(from: position)
	}
	
	var body: some View {
		NavigationView {
			VStack {
				HStack {
					
					Text("Position #")
						.font(.title2)
						.bold()
					
					Spacer()
					
					Button {
						isFavourite.toggle()
					} label: {
						ZStack {
							RoundedRectangle(cornerRadius: 15)
								.frame(width: 50, height: 40)
								.foregroundStyle(Color.buttonBlue)
							isFavourite ? Image(systemName: "heart") : Image(systemName: "heart.fill")
						}
					}
					
					ShareLink(item: "Check out this Chess960 position: #\(positionID)") {
						ZStack {
							RoundedRectangle(cornerRadius: 15)
								.frame(width: 50, height: 40)
								.foregroundStyle(Color.buttonBlue)
							Image(systemName: "square.and.arrow.up")
						}
					}
					
					/*Button {
						isSharing.toggle()
					} label: {
						ZStack {
							RoundedRectangle(cornerRadius: 15)
								.frame(width: 50, height: 40)
								.foregroundStyle(Color.buttonBlue)
							Image(systemName: "square.and.arrow.up")
						}
					}*/
					
				}
				.padding(.horizontal, 8)
				
				Text("\(positionID)")
					.leading()
					.font(.custom("VoidSemibold", size: 45))
					.padding(8)
				
				Text("Viewing mode")
					.leading()
					.padding(.horizontal, 8)
				
				Picker("Select a Mode", selection: $selectedOption) {
					ForEach(options, id: \.self) { option in
						Text(option) // Display each option as Text
					}
				}
				.pickerStyle(.segmented)
				.padding()
				
				Text("1st Rank")
					.leading()
					.padding(8)
				
					// MARK: - the generated board is here.
				HStack {
					ForEach(0..<position.count, id: \.self) { index in
						Text(position[index])
							.font(.custom("VoidRegular", size: 30))
							.frame(width: 44, height: 44)
							.background(Color.gray.opacity(0.3))
							.cornerRadius(6)
							.font(.largeTitle)
					}
				}
				
				Spacer().frame(height: 30*3)
				
				VStack {
					HStack {
							// MARK: - Regenerate button
						Button {
								// Regenerate action
						} label: {
							ZStack {
								RoundedRectangle(cornerRadius: 15)
									.frame(width: 180, height: 50)
									.foregroundStyle(Color.buttonBlue)
								HStack {
									Image(systemName: "shuffle")
									Text("Regenerate")
								}
							}
						}
						
							// MARK: - Board View
						Button {
							
						} label: {
							ZStack {
								RoundedRectangle(cornerRadius: 15)
									.frame(width: 180, height: 50)
									.foregroundStyle(Color.buttonBlue)
								Text("Board View")
							}
						}
					}
					
					Button {
						
					} label: {
						ZStack {
							RoundedRectangle(cornerRadius: 15)
								.foregroundStyle(Color.buttonBlue)
								.frame(width:370, height: 50)
							Text("Play this position")
						}
						
					}
					
				}
			}
			.navigationTitle("Generated Position")
			.sheet(isPresented: $isSharing) {
				ShareSheet(activityItems: ["Check out this Chess960 position: #\(positionID)"])
			}
		}
	}
		// MARK: - Chess960 ID Calculation
	private func calculateChess960ID(from position: [String]) -> Int {
			// A mock calculation for now; real logic would involve encoding bishops, rooks, king, etc.
		var hash = 0
		
			// Example encoding: Convert pieces to numeric values and sum them
		for (index, piece) in position.enumerated() {
			hash += pieceValue(piece) * (index + 1)
		}
		
			// Ensure the result is within 1 to 960 range
		return (hash % 960) + 1
	}
	private func pieceValue(_ piece: String) -> Int {
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

struct ShareSheet: UIViewControllerRepresentable {
	let activityItems: [Any]

	func makeUIViewController(context: Context) -> UIActivityViewController {
		UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
	}

	func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}

#Preview {
	PositionDetailView(position: ["R", "N", "B", "Q", "K", "B", "N", "R"]) // Example of a Chess960 position
}

struct SheetView: View {
	var body: some View {
		Text("Hello")
	}
}

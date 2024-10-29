	//
	//  PositionDetailView.swift
	//  Fischr
	//
	//  Created by Wendy Zhou on 28/10/2024.
	//

import SwiftUI

struct PositionDetailView: View {
	
	@State private var selectedOption = "Visual"
	let options = ["Visual", "Text"]
	let position: [String]
	
	var body: some View {
		NavigationView {
			VStack {
				HStack {
					Text("Position #")
					Spacer()
					Button {
							// Favorite action
					} label: {
						ZStack {
							RoundedRectangle(cornerRadius: 15)
								.frame(width: 50, height: 40)
								.foregroundStyle(Color.buttonBlue)
							Image(systemName: "heart")
						}
					}
					
					Button {
							// Share action
					} label: {
						ZStack {
							RoundedRectangle(cornerRadius: 15)
								.frame(width: 50, height: 40)
								.foregroundStyle(Color.buttonBlue)
							Image(systemName: "square.and.arrow.up")
						}
					}
					
				}
				.padding(.horizontal, 8)
				
					// MARK: - the generated number is here.
				
				Text("Viewing mode")
					.leading()
					.padding(8)
				
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
							.frame(width: 44, height: 44)
							.background(Color.gray.opacity(0.3))
							.cornerRadius(6)
							.font(.largeTitle)
							
					}
				}
				
				
				Spacer()
				
				HStack {
						// MARK: - Regenerate button
					Button {
							// Regenerate action
					} label: {
						ZStack {
							RoundedRectangle(cornerRadius: 15)
								.frame(width: 180, height: 50)
								.foregroundStyle(Color.buttonBlue)
							Text("Regenerate")
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
			}
			.navigationTitle("Generated Position")
		}
	}
}

#Preview {
	PositionDetailView(position: ["R", "N", "B", "Q", "K", "B", "N", "R"]) // Example of a Chess960 position
}

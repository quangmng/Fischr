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
	
	var body: some View {
		NavigationView {
			VStack {
				HStack {
					Text("Position #")
					Spacer()
					Button {
						
					} label: {
						ZStack {
							RoundedRectangle(cornerRadius: 15)
								.frame(width: 50, height: 40)
								.foregroundStyle(Color.buttonBlue)
							Image(systemName: "heart")
						}
					}
					
					Button {
						
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
				.pickerStyle(.palette)
				.padding()
				
				Text("1st Rank")
					.leading()
					.padding(8)
				
				// MARK: - the generated board is here.
				
				HStack {
					
						// MARK: - Regenerate button
					Button {
						
					} label: {
						ZStack {
							RoundedRectangle(cornerRadius: 15)
								.frame(width: 200, height: 50)
								.foregroundStyle(Color.buttonBlue)
							Text("Regenerate")
						}
					}
					
						// MARK: - Board View
					Button {
						
					} label: {
						ZStack {
							RoundedRectangle(cornerRadius: 15)
								.frame(width: 200, height: 50)
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
	PositionDetailView()
}

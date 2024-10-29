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
	@ObservedObject private var viewModel: PositionViewModel
	@State private var selectedOption = "Text"
	let options = ["Text","Visual"]
	
	private var positionID: Int {
		viewModel.calculateChess960ID(from: viewModel.position)
	}
	
	init(viewModel: PositionViewModel) {
		self.viewModel = viewModel
	}
	
	var body: some View {
		NavigationStack {
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
							Image(systemName: isFavourite ? "heart.fill" : "heart")
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
				}
				.padding(.horizontal, 8)
				
				Text("\(viewModel.calculateChess960ID(from: viewModel.position))")
					.leading()
					.font(.custom("VoidSemibold", size: 45))
					.padding(8)
				
				VStack(alignment: .leading) {
					Text("Select viewing mode")
						.padding(.leading, 12)
					Picker("", selection: $selectedOption) {
						ForEach(options, id: \.self) { option in
							Text(option) // Display each option as Text
						}
					}
					.pickerStyle(.segmented)
					.padding()
				}
				
				Text("1st Rank")
					.leading()
					.padding(8)
				
					// MARK: - the generated board is here.
				HStack {
					if selectedOption == "Text"{
						ForEach(viewModel.position, id: \.self) { index in
							Text(index)
								.font(.custom("VoidRegular", size: 30))
								.frame(width: 44, height: 44)
								.background(Color.gray.opacity(0.3))
								.cornerRadius(6)
						}
					}
					else{
						
						ForEach(0..<viewModel.vPosition.count) {index in
							viewModel.vPosition[index]
								.resizable()
								.frame(width: 44, height: 44)
								.background(Color.gray.opacity(0.3))
								.cornerRadius(6)
						}
						
					}
				}
				
				Spacer().frame(height: 90)
				
				VStack {
					HStack {
							// MARK: - Regenerate button
						Button {
							viewModel.regeneratePosition()
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
			.toolbar(.hidden, for: .tabBar)
			.sheet(isPresented: $isSharing) {
				ShareSheet(activityItems: ["Check out this Chess960 position: #\(positionID)"])
			}
			.onAppear(){
				viewModel.regeneratePosition()
			}
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
	// Provide an example position for the preview
	PositionDetailView(viewModel: PositionViewModel(position: ["R", "N", "B", "Q", "K", "B", "N", "R"], vPosition: []))
}


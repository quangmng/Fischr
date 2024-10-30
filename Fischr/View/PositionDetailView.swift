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
	@ObservedObject private var gvm: GenerateViewModel
	
	init(viewModel: PositionViewModel, gvm: GenerateViewModel) {
		self.viewModel = viewModel
		self.gvm = gvm
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
						withAnimation {
							isFavourite.toggle()
						}
							//						gvm.updateObj(for: GenerateEntity(), isFavourite: isFavourite)
						if let entity = gvm.storedGeneration.first(where: { $0.positionGenerated == viewModel.currentPosition }) {
							gvm.updateObj(for: entity, isFavourite: isFavourite)
						}
					} label: {
						ZStack {
							RoundedRectangle(cornerRadius: 15)
								.frame(width: 50, height: 40)
								.foregroundStyle(Color.buttonBlue)
							Image(systemName: isFavourite ? "heart.fill" : "heart")
						}
					}
					
					ShareLink(item: "Check out this Chess960 position: #\(viewModel.positionID)") {
						ZStack {
							RoundedRectangle(cornerRadius: 15)
								.frame(width: 50, height: 40)
								.foregroundStyle(Color.buttonBlue)
							Image(systemName: "square.and.arrow.up")
						}
					}
				}
				.padding(.horizontal, 8)
				
				Text("\(viewModel.positionID)")
					.leading()
					.font(.custom("VoidSemibold", size: 45))
					.padding(8)
				
				VStack(alignment: .leading) {
					Text("Select viewing mode")
					
					Picker("", selection: $selectedOption) {
						ForEach(options, id: \.self) { option in
							Text(option) // Display each option as Text
						}
					}
					.pickerStyle(.segmented)
					
				}
				.padding()
				
				VStack{
					Text("1st Rank")
						.leading()
						.padding(.leading,16)
					
						// MARK: - the generated board is here.
					HStack() {
						if selectedOption == "Text" {
							ForEach(Array(viewModel.container.enumerated()), id: \.offset) { index, character in
								Text(character)
									.font(.custom("VoidRegular", size: 30))
									.frame(width: 44, height: 44)
									.background(Color.gray.opacity(0.3))
									.cornerRadius(6)
								
								
							}
						} else {
							ForEach(Array(viewModel.vPosition.enumerated()), id: \.offset) { index, imageName in
								Image(imageName)
									.resizable()
								
									.aspectRatio(contentMode: .fit)
									.frame(width: 44, height: 44)
									.padding(5)
								
									.background(Color.gray.opacity(0.3))
									.cornerRadius(6)
								
							}
							
							
						}
						
					}
					.scaleEffect(0.85)
					
				}
				
				
				
				Spacer().frame(height: 90)
				
				VStack {
					HStack {
							// MARK: - Regenerate button
						Button {
							viewModel.generateNewPosition()
							gvm.add(newGenerate: viewModel.currentPosition, isFavourite: false, date: Date())
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
					}
				}
			}
			.padding()
			
			.navigationTitle("Generated Position")
			.toolbar(.hidden, for: .tabBar)
			.sheet(isPresented: $isSharing) {
				ShareSheet(activityItems: ["Check out this Chess960 position: #\(viewModel.positionID)"])
			}
				// temporary
			.onAppear(){
					//                viewModel.generateNewPosition()
				gvm.add(newGenerate: viewModel.currentPosition, isFavourite: false, date: Date())
				
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
	PositionDetailView(viewModel: PositionViewModel(), gvm: GenerateViewModel())
}

	//
	//  GenerateView.swift
	//  Fischr
	//
	//  Created by Cheuk Hei So on 25/10/2024.
	//

import SwiftUI

struct GenerateView: View {
	
	@Binding var isFavourite: Bool
	@State private var currentPosition: [String] = Array(repeating: "", count: 8) // Store the current 960 position
//	@State private var navigateToDetail = false
	
	var body: some View {
		NavigationStack {
			ScrollView {
				VStack(alignment: .leading) {
					Text("Modes")
						.font(.headline)
						.leading()
						.padding(.horizontal)
					
					NavigationLink {
						PositionDetailView(position: currentPosition)
					} label: {
						ZStack {
							RoundedRectangle(cornerRadius: 20)
								.foregroundStyle(Color.fischrTab)
								.frame(height: 180)
								.padding(.horizontal, 20)
							
							Image(systemName: "shuffle")
								.resizable()
								.frame(width: 60, height: 50)
								
							
							VStack {
								Text("Random")
									.font(.custom("VoidRegular", size: 35))
									.bottomLeading()
									.padding(.horizontal, 40)
							}
							.padding(.bottom, 15)
						}
						.foregroundStyle(Color.primary)
					}
					
					
					Spacer().frame(height: 30)
					
					HStack {
						optionCard(systemName: "numbers.rectangle.fill", text: "By Number", color: .blackPink)
						optionCard(imageName: "PawnOutline", text: "Pieces ▶️ Pos.", color: .newPurple)
					}
					.padding(.horizontal, 20)
					
					
				}
				
				Spacer().frame(height: 30)
				
				HStack {
					Text("History (10 recent)")
						.font(.headline)
						.leading()
						.padding(.horizontal)
					
					NavigationLink{
						PlayView() //suppose to navigate to all generation view
					} label: {
						Text("All")
							.foregroundColor(.white)
							.frame(width: 50, height: 1)
							.padding()
							.background(Color.black)
							.cornerRadius(25)
					}
					.padding()
					.frame(height: 5)
					
				}
				ScrollView(.horizontal) {
					
					HistoryItemView(isFavourite: $isFavourite)
						.padding()
					
						// Use ForEach loop to display recent matches using history Item View
				}
			}
			.navigationTitle("Generate")
			
			
			
		}
	}
	private func generatePosition() {
		currentPosition = generateChess960Position()
	}
	
	private func optionCard(systemName: String? = nil, imageName: String? = nil, text: String, color: Color) -> some View {
		ZStack {
			RoundedRectangle(cornerRadius: 20)
				.foregroundStyle(color)
				.frame(width: .infinity, height: 150)
			
			VStack {
				if let systemName = systemName {
					Image(systemName: systemName)
						.resizable()
						.frame(width: 80, height: 60)
				}
				
				if let imageName = imageName {
					Image(imageName)
						.resizable()
						.frame(width: 80, height: 80)
						.scaleEffect(0.9, anchor: .center)
				}
				
				Text(text)
					.font(.custom("VoidRegular", size: 27))
					.fontWeight(.bold)
			}
		}
	}
}

#Preview {
	GenerateView(isFavourite: .constant(false))
}



	// MARK: Modify ideas
	// create seperate card view and work with navigation Link using ForEachLoop ?


	// The code below does successfully navigate but random bugs appeare
	///.onTapGesture {
	//pTapped.toggle()
	//}
	//NavigationLink("", destination: PlayView(), isActive: $pTapped)
	//
	//}

	//struct GenerateView_Previews: PreviewProvider {
	//    static var previews: some View {
	//        let gvm = GenerateViewModel()
	//
	//        GenerateView(ge: .constant(gvm.storedGeneration[0]))
	//    }
	//}

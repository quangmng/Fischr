	//
	//  GenerateView.swift
	//  Fischr
	//
	//  Created by Cheuk Hei So on 25/10/2024.
	//

import SwiftUI

struct GenerateView: View {
	
    @State var isFavourite: Bool
	@State private var shouldNavigate = false
    @State var gvm: GenerateViewModel
    @StateObject private var viewModel = PositionViewModel()
	
	var body: some View {
		NavigationStack {
			ScrollView {
				VStack(alignment: .leading) {
					Text("Modes")
						.font(.headline)
						.leading()
						.padding(.horizontal)
					
					NavigationLink{
                        PositionDetailView(viewModel: viewModel, gvm: GenerateViewModel())
					} label:{
						RandomButton()
                        
					}
						
				
					
					Spacer().frame(height: 30)
					
					HStack {
						NavigationLink{
							ByNumberView(viewModel: viewModel, gvm: GenerateViewModel())
						} label:{
							NumberButton()
							
						}
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
                        PositionDetailView(viewModel: PositionViewModel(), gvm:GenerateViewModel()) //supposed to navigate to all generation view
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
					
					
						// Use ForEach loop to display recent matches using history Item View
                    
                    HStack {
                        ForEach(gvm.storedGeneration.suffix(10), id:\.self){ index in
                            NavigationLink(destination:
                                            SavedDetailView(isFavourite: index.isFavourite, viewModel: PositionViewModel(), selectedOption: "Text", gvm: GenerateViewModel(), posID: index.positionGenerated ?? "0")){
                                HistoryItemView(positionGenerated: index.positionGenerated ?? "", isFavourite: index.isFavourite)
                            }
                                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding()
                    
				}
			}
			.navigationTitle("Generate")
		}
        .onAppear{gvm.fetchCoreData()}
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
    GenerateView(isFavourite: true, gvm: GenerateViewModel())
}



struct RandomButton: View {
	var body: some View {
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
		.foregroundStyle(Color.black)
		
	}
}


struct NumberButton: View{
	var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 20)
				.foregroundStyle(Color.blackPink)
				.frame(height: 160)
				.padding(.horizontal, 20)
				
			
			Image(systemName: "numbers.rectangle.fill")
				.resizable()
				.frame(width: 60, height: 50)
			
			VStack {
				Text("ByNumber")
					.font(.custom("VoidRegular", size: 35))
					.bottomLeading()
					.padding(.horizontal, 40)
			}
			.padding(.bottom, 15)
			
		}
		.foregroundStyle(Color.primary)
		
	}
}

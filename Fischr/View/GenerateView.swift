	//
	//  GenerateView.swift
	//  Fischr
	//
	//  Created by Cheuk Hei So on 25/10/2024.
	//

import SwiftUI

struct GenerateView: View {
	
	@Binding var isFavourite: Bool
	
	var body: some View {
		NavigationView{
			ScrollView{
				
				
				VStack(alignment: .leading) {
					
					Text("Generate")
						.font(.title)
						.fontWeight(.bold)
						.padding()
						.leading()
					
					Text("Modes")
						.font(.headline)
						.leading()
						.padding(.horizontal)
					
					ZStack() {
						
						RoundedRectangle(cornerRadius: 20)
							.foregroundStyle(Color.fischrTab)
							.frame(height: 180)
							.padding(.horizontal, 20)
						
						Image(systemName: "shuffle")
							.resizable()
							.frame(width: 120/2, height: 100/2)
//							.font(.system(size: 30))
							.foregroundColor(.black)
						
						VStack {
							Text("Random")
								.font(.custom("VoidRegular", size: 35))
								.bottomLeading()
								.padding(.horizontal, 40)
						}
						.padding(.bottom, 15)
					}
					
					HStack {
						ZStack {
							RoundedRectangle(cornerRadius: 20)
								.foregroundStyle(Color.blackPink)
								.frame(width: .infinity, height: 150)
							
							VStack {
								Image(systemName: "numbers.rectangle.fill")
									.resizable()
									.frame(width: 80, height: 60)
								
									Text("By Number")
									.font(.custom("VoidRegular", size: 27))
										.fontWeight(.bold)
							}
						}
						
						
						ZStack {
							RoundedRectangle(cornerRadius: 20)
								.foregroundStyle(Color.newPurple)
								.frame(width: .infinity, height: 150)
							
							VStack {
								Image("PawnOutline")
									.resizable()
									.frame(width: 80, height: 80)
									.scaleEffect(0.9, anchor: .center)
								Text("Pieces ▶️ Pos.")
									.font(.custom("VoidRegular", size: 27))
									.fontWeight(.bold)
//									.padding()
							}
						}
					}
					.padding(.horizontal, 20)
				}
				Spacer().frame(height: 30)
				HStack{
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
				ScrollView(.horizontal){
					
					HistoryItemView(isFavourite: $isFavourite)
						.padding()
					
						// Use ForEach loop to display recent matches using history Item View
					
						//                        ForEach{
						//
						//                        }
					
					
				}
				
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

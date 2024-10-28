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
					
					ZStack(alignment: .bottomLeading) {
						
						ZStack{
							RoundedRectangle(cornerRadius: 20)
								.foregroundStyle(Color.gray)
								.frame(height: 200)
								.padding(.horizontal, 20)
							
							Image(systemName: "shuffle")
								.font(.system(size: 30))
								.foregroundColor(.black)
								.position(x:200, y: 100)
						}
						
						VStack(alignment: .leading){
								// Text below the icon
							Text("Random")
								.font(.title2) // Text style
								.foregroundColor(.black)
								//.leading()
								.padding([.leading, .bottom], 16)
								.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
						}
//						.padding()
					}
					
					HStack {
						ZStack {
							RoundedRectangle(cornerRadius: 20)
								.foregroundStyle(Color.gray)
								.frame(width: .infinity, height: 150)
							
							VStack {
								Image(systemName: "numbers.rectangle.fill")
									.resizable()
									.frame(width: 80, height: 60)
								
								Text("By Number")
									.font(.title2)
									.fontWeight(.bold)
									.padding()
							}
						}
						
						
						ZStack {
							RoundedRectangle(cornerRadius: 20)
								.foregroundStyle(Color.gray)
								.frame(width: .infinity, height: 150)
							
							VStack {
								Image(systemName: "shuffle")
									.resizable()
									.frame(width: 80, height: 60)
								
								Text("Pieces > Pos.")
									.font(.title2)
									.fontWeight(.bold)
									.padding()
							}
						}
					}
					.padding(.horizontal, 20)
				}
				
				HStack{
					Text("History (10 recent)")
						.font(.headline)
						.leading()
						.padding(.horizontal)
					
					NavigationLink{
						PlayView() //suppose to navigate to all generation view
					}label: {
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

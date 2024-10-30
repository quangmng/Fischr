	//
	//  HomeView.swift
	//  Fischr
	//
	//  Created by Wendy Zhou on 23/10/2024.
	//
import Foundation
import SwiftUI

struct HomeView: View {
	
	@State var getStarted: Bool = false
	@Binding var isFavourite: Bool
	@Binding var selectedTab: Int
	@State var gvm = GenerateViewModel()
	
	var body: some View {
		
		
		NavigationStack {
			getStartedView()
				.onTapGesture {
					selectedTab = 1 // Switch to GenerateView tab
				}
			
			VStack {
				Text("At A Glance")
					.font(.title)
					.bold()
					.leading()
					.padding(.horizontal)
				
				Section("SAVED POSITIONS"){
					
					
					ScrollView(.horizontal){
						HStack{
                            ForEach(gvm.storedGeneration){ index in
								NavigationLink(destination:
												SavedDetailView(isFavourite: index.isFavourite, viewModel: PositionViewModel(), selectedOption: "Text", gvm: GenerateViewModel(), posID: index.positionGenerated ?? "0")){
									HistoryItemView(positionGenerated: index.positionGenerated ?? "", isFavourite: index.isFavourite)
									
								}
							}
							.buttonStyle(PlainButtonStyle())
						}
					}
					
				}
				.leading()
				.padding(20)
				.navigationTitle("Fischr")
			}
		}
	}
	}

#Preview {
	HomeView(isFavourite: .constant(true), selectedTab: .constant(0))
}


	//
	//  HomeView.swift
	//  Fischr
	//
	//  Created by Wendy Zhou on 23/10/2024.
	//

import SwiftUI

struct HomeView: View {  
	
	@State var Gen = GenerateViewModel()
	@State var getStarted: Bool = false
	@Binding var isFavourite: Bool
	@Binding var selectedTab: Int
	
	var body: some View {
		NavigationStack {
			VStack {
//				NavigationLink {
//					GenerateView(isFavourite: $isFavourite)
//				} label: {
//					getStartedView()
//				}
				
				getStartedView()
					.onTapGesture {
						selectedTab = 1 // Switch to GenerateView tab
					}
				
				VStack {
					Text("At A Glance")
						.font(.title)
						.bold()
						.leading()
					
					Section("SAVED POSITIONS") {
						LazyHStack (spacing: 20) {
							ForEach(Gen.last10Gen, id: \.self) { gen in
//                                HistoryItemView(positionGenerated: pos, isFavourite: isFavourite)
							}
						}
					}
					.leading()
				}
				.padding(20)
			}
			.navigationTitle("Fischr")
		}
	}
}

#Preview {
	HomeView(isFavourite: .constant(true), selectedTab: .constant(0))
}

struct getStartedView: View {
	var body: some View {
		ZStack(alignment: .bottomLeading) {
			ZStack {
				RoundedRectangle(cornerRadius: 20)
					.foregroundStyle(Color.gray)
					.frame(width: .infinity, height: 270)
				
				Image("AllChess")
					.resizable()
					.frame(height: 270)
				
			}
//			.padding()
			
			VStack(alignment: .leading) {
				Text("Get Started")
					.foregroundStyle(Color.primary)
					.font(.title)
					.bold()
				Text("Sharpen your skills and challenge your mind")
					.foregroundStyle(Color.primary)
			}
			.padding()
		}
		.padding(.horizontal,12)
	}
}

	//
	//  HomeView.swift
	//  Fischr
	//
	//  Created by Wendy Zhou on 23/10/2024.
	//

import SwiftUI

struct HomeView: View {
	var body: some View {
		NavigationStack {
			VStack() {
				HStack {
					Text("Sharpen \nyour skills \nand \nchallenge \nyour mind!")
						.font(.title)
						.bold()
					Spacer().frame(width: 60*3)
				}
				
				Spacer().frame(height: 230)
				
				ZStack {
					RoundedRectangle(cornerRadius: 20)
						.fill(Color.red)
						.frame(width: 150, height: 150)
						.offset(x: 80)  // Shift to the left
					
					RoundedRectangle(cornerRadius: 20)
						.fill(Color.blue)
						.frame(width: 150, height: 150)
					
					RoundedRectangle(cornerRadius: 20)
						.fill(Color.yellow)
						.frame(width: 150, height: 150)
						.offset(x: -80)   // Shift to the right
				}
				.padding()
			}
			.toolbar {
				ToolbarItem(placement: .topBarLeading) {
					HStack {
						Spacer(minLength: 12)
						Image(systemName: "person")
							.font(.title2)
					}
				}
				
				ToolbarItem(placement: .topBarTrailing) {
					HStack {
						Image(systemName: "gear")
							.font(.title2)
						Spacer(minLength: 12)
					}
				}
			}
		}
	}
}

#Preview {
	HomeView()
}

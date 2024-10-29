	//
	//  ContentView.swift
	//  Fischr
	//
	//  Created by Quang Minh Nguyen on 19/10/2024.
	//

import SwiftUI

struct ContentView: View {
	
	@Binding var isFavourite: Bool
	@State private var selectedTab: Int = 0
	
	var body: some View {
		TabView(selection: $selectedTab) {
			
			HomeView(isFavourite: $isFavourite, selectedTab: $selectedTab)
				.tabItem {
					Label("Home", systemImage: "house")
				}
				.tag(0)
			
			GenerateView(isFavourite: $isFavourite)
				.tabItem {
					Label("Generate", systemImage: "wrench.adjustable.fill")
				}
				.tag(1)
			
			SettingsView()
				.tabItem {
					Label("Settings", systemImage: "gearshape")
				}
				.tag(2)
		}
	}
}


struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView(isFavourite: .constant(false))
	}
}

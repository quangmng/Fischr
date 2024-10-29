//
//  ContentView.swift
//  Fischr
//
//  Created by Quang Minh Nguyen on 19/10/2024.
//

import SwiftUI

struct ContentView: View {
	
	@Binding var isFavourite: Bool
	
    var body: some View {
        NavigationStack {
            TabView {
                // embed 1st tab here,
				HomeView(isFavourite: $isFavourite)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		ContentView(isFavourite: .constant(false))
    }
}

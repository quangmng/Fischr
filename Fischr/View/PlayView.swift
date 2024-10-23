//
//  PlayView.swift
//  Fischr
//
//  Created by Wendy Zhou on 23/10/2024.
//

import SwiftUI

struct PlayView: View {
    var body: some View {
		VStack{
			HStack{
				Rectangle().foregroundStyle(.gray)
				Rectangle()
			}
			.frame(height: 100)
			HStack{
				
			}
		}
		.edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    PlayView()
}

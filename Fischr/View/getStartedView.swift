//
//  getStartView.swift
//  Fischr
//
//  Created by Wendy Zhou on 30/10/2024.
//

import SwiftUI

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


#Preview {
    getStartedView()
}

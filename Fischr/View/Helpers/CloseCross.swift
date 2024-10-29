//
//  CloseCross.swift
//  Fischr
//
//  Created by Wendy Zhou on 29/10/2024.
//

import SwiftUI

struct CloseCross: View {
	@Environment(\.colorScheme) var colorScheme
	
	var body: some View {
		ZStack {
			Circle()
				.fill(Color(white: colorScheme == .dark ? 0.19 : 0.93))
			Image(systemName: "xmark")
				.resizable()
				.scaledToFit()
				.font(Font.body.weight(.bold))
				.scaleEffect(0.416)
				.foregroundColor(Color(white: colorScheme == .dark ? 0.62 : 0.51))
		}
	}
}

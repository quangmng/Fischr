	//
	//  UIExtension.swift
	//  Fischr
	//
	//  Created by Cheuk Hei So on 25/10/2024.
	//

import SwiftUI

extension View{
	
	func leading() -> some View {
		self.frame(maxWidth: .infinity, alignment: .leading)
	}
	
	func traling() -> some View{
		self.frame(maxWidth: .infinity, alignment: .trailing)
	}
	
	func center() -> some View{
		self.frame(maxWidth: .infinity, alignment: .center)
	}
	
	func bottomLeading() -> some View {
		self.frame(maxWidth: .infinity, alignment: .bottomLeading)
	}
}


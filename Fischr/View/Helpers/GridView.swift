	//
	//  GirdView.swift
	//  Fischr
	//
	//  Created by Wendy Zhou on 23/10/2024.
	//

	import SwiftUI

	struct GridView: View {
		var body: some View {
			Rectangle()
				.stroke(.black, lineWidth: 2)
				.fill(.white)
				.frame(width:60, height: 80)
	//			.foregroundStyle(.white)
				
		}
	}

	struct GridView_Preview: PreviewProvider {
		static var previews: some View {
			GridView()
		}
	}

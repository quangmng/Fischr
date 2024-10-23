	//
	//  GridBView.swift
	//  Fischr
	//
	//  Created by Wendy Zhou on 23/10/2024.
	//

	import SwiftUI

	struct GridBView: View {
		var body: some View {
			Rectangle()
				.stroke(.black, lineWidth: 2)
				.fill(.gray)
				.frame(width:60, height: 80)
	//			.foregroundStyle(.gray)
				
		}
	}

	struct GridBView_Preview: PreviewProvider {
		static var previews: some View {
			GridBView()
		}
	}

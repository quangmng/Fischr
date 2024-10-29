	//
	//  PositionViewModel.swift
	//  Fischr
	//
	//  Created by Wendy Zhou on 29/10/2024.
	//

import Foundation
import SwiftUI

class PositionViewModel: ObservableObject {
	let initialPosition = 0
	@Published var positionIndex: Int = Positions.initialPositionIndex
	
	func generateNewPosition() {
		self.positionIndex = Int.random(in: 0..<960)
		animatePositionChange()
	}
	
}




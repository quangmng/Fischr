//
//  String.swift
//  Fischr
//
//  Created by Quang Minh Nguyen on 29/10/2024.
//

import Foundation
import SwiftUI

extension String {
    var chessSymbolized: String {
        return self
            .replacingOccurrences(of: "R", with: "ä")
            .replacingOccurrences(of: "N", with: "â")
            .replacingOccurrences(of: "B", with: "à")
            .replacingOccurrences(of: "Q", with: "æ")
            .replacingOccurrences(of: "K", with: "è")
            .replacingOccurrences(of: "P", with: "ê")
    }
}

extension StringProtocol {
    func indexDistance(of element: Element) -> Int? { firstIndex(of: element)?.distance(in: self) }
    func indexDistance<S: StringProtocol>(of string: S) -> Int? { range(of: string)?.lowerBound.distance(in: self) }
}
extension Collection {
    func distance(to index: Index) -> Int { distance(from: startIndex, to: index) }
}
extension String.Index {
    func distance<S: StringProtocol>(in string: S) -> Int { string.distance(to: self) }
}



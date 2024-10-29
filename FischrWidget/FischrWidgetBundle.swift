//
//  FischrWidgetBundle.swift
//  FischrWidget
//
//  Created by Wendy Zhou on 30/10/2024.
//

import WidgetKit
import SwiftUI

@main
struct FischrWidgetBundle: WidgetBundle {
    var body: some Widget {
        FischrWidget()
        FischrWidgetControl()
        FischrWidgetLiveActivity()
    }
}

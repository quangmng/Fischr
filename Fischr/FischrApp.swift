//
//  FischrApp.swift
//  Fischr
//
//  Created by Quang Minh Nguyen on 19/10/2024.
//

import SwiftUI

@main
struct FischrApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
			
            ContentView(isFavourite: .constant(false))
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
		
        }
    }
}

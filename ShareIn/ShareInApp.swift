//
//  ShareInApp.swift
//  ShareIn
//
//  Created by IAAA Technologies on 06/11/22.
//

import SwiftUI

@main
struct ShareInApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

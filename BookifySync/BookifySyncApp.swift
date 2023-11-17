//
//  BookifySyncApp.swift
//  BookifySync
//
//  Created by Martin Mungai on 17/11/2023.
//

import SwiftUI

@main
struct BookifySyncApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

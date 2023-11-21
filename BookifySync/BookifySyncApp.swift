//
//  BookifySyncApp.swift
//  BookifySync
//
//  Created by Martin Mungai on 17/11/2023.
//

import SwiftUI

import GoogleSignIn

@main
struct BookifySyncApp: App {
    let persistenceController = PersistenceController.shared
    
    init() {
        Fonts.registerFonts()
    }

    var body: some Scene {
        WindowGroup {
            AuthView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .onAppear {
                    GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                        if error != nil || user == nil {
                            
                        } else {
                            
                        }
                    }
                }
                .onOpenURL { url in
                    GIDSignIn.sharedInstance.handle(url)
                }
        }
    }
}

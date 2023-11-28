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
    init() {
        Fonts.registerFonts()
    }
    
    let store = CalendarReducer.mockStore()

    var body: some Scene {
        WindowGroup {
            AuthView(store: store)
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

//
//  BookifySyncApp.swift
//  BookifySync
//
//  Created by Martin Mungai on 17/11/2023.
//

import SwiftUI

import GoogleSignIn
import GoogleSignInSwift

@main
struct BookifySyncApp: App {
    let persistenceController = PersistenceController.shared
    
//    @UIApplicationDelegateAdaptor(AppDelegate.self)
//    private var appDelegate

    var body: some Scene {
        WindowGroup {
            AuthView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .onAppear {
                    GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                        if error != nil || user == nil {
                            // sign out state
                        } else {
                            // sign in state
                        }
                    }
                }
                .onOpenURL { url in
                    GIDSignIn.sharedInstance.handle(url)
                }
        }
    }
}

struct AuthView: View {
    var body: some View {
        VStack {
            
            GoogleSignInButton(action: handleSignIn)
            
        }
    }
    
    private func handleSignIn() {
        GIDSignIn.sharedInstance.signIn(
            withPresenting: UIHostingController(rootView: self)
        ) { result, error in
            
            guard let result else {
                // Check error
                
                return
            }
            
            
        }
    }
}



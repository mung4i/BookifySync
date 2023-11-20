//
//  AuthView.swift
//  BookifySync
//
//  Created by Martin Mungai on 17/11/2023.
//

import Foundation
import SwiftUI
import UIKit

import GoogleSignIn
import GoogleSignInSwift

struct AuthView: View {
    
    private let presentingController = UIHostingController(
        rootView: EmptyView())
    
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 16
        ) {
            
            AuthHeaderView()
                .padding(.top, 64)
            
            Spacer()
            
            GoogleSignInButton(action: handleSignIn)
            
            Spacer()
            
        }
        .padding(.horizontal, 16)
    }
    
    private func handleSignIn() {
        GIDSignIn.sharedInstance.signIn(
            withPresenting: UIApplication.shared.rootViewController
        ) { result, error in
            
            guard let result else {
                handleError(error)
                return
            }
            
            handleResult(result)
        }
    }
    
    private func handleResult(_ result: GIDSignInResult) {}
    
    private func handleError(_ error: Error?) {}
}

#Preview {
    AuthView()
}

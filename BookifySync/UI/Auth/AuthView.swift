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

import ComposableArchitecture

struct AuthView: View {
    let store: StoreOf<CalendarReducer>
    @State private var showNextView = false
    
    var body: some View {
        NavigationView {
            VStack(
                alignment: .leading,
                spacing: 16
            ) {
                if $showNextView.wrappedValue {
                    NavigationLink(
                        destination: RootTabView(store: store),
                        isActive: $showNextView,
                        label: { EmptyView() })
                }
                
                AuthHeaderView()
                    .padding(.top, 64)
                
                Spacer()
                
                GoogleSignInButton(action: handleSignIn)
                
                Spacer()
                
            }
            .padding(.horizontal, 16)
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden()
            .navigationViewStyle(.stack)
        }
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
    
    private func handleResult(_ result: GIDSignInResult) {
        showNextView = true
    }
    
    private func handleError(_ error: Error?) {}
}

#Preview {
    AuthView(store: CalendarReducer.mockStore())
}

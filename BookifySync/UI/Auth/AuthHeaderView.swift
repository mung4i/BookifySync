//
//  AuthHeaderView.swift
//  BookifySync
//
//  Created by Martin Mungai on 18/11/2023.
//

import SwiftUI

struct AuthHeaderView: View {
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 32
        ) {
            
            Text("BookifySync ")
                .font(.largeTitle)
                .bold()
            
            Text("Sign in to schedule events from all your favorite booking platforms!")
                .font(.title3)
        }
    }
}

#Preview {
    AuthHeaderView()
}

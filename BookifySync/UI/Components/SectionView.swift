//
//  SectionView.swift
//  BookifySync
//
//  Created by Martin Mungai on 18/11/2023.
//

import SwiftUI

struct SectionView: View {
    let action: Action
    let sectionTitle: String

    var body: some View {
        VStack {
            Text(sectionTitle)
                .font(.headline)
                .padding()
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .border(Color.gray, width: 0.5)
        .onTapGesture { action() }
    }
}

#Preview {
    SectionView(action: {}, sectionTitle: "Listing")
}

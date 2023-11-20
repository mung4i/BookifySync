//
//  ListingView.swift
//  BookifySync
//
//  Created by Martin Mungai on 20/11/2023.
//

import SwiftUI

struct ListingView: View {
    let traveler: Traveler

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Traveler's details:")
                .font(.subheading2)
            
            TravelerCard(traveler: traveler)
            
            Spacer()
            
            TravelerDetailsCard(traveler: traveler)
            
        }
        .padding(.all, 16)
        .frame(width: 330, height: 389)
        .shadow(color: Color(red: 0.86, green: 0.86, blue: 0.86), radius: 45, x: 20, y: 20)
        .shadow(color: .black.opacity(0.05), radius: 20, x: -20, y: -20)
        .cornerRadius(8)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray.opacity(0.1))
        }
    }
}

#Preview {
    ListingView(traveler: Traveler.examples.last!)
}

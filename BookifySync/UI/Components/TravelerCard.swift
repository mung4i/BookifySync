//
//  TravelerCard.swift
//  BookifySync
//
//  Created by Martin Mungai on 20/11/2023.
//

import SwiftUI

struct TravelerCard: View {
    let traveler: Traveler
    
    var body: some View {
        HStack {
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 80, height: 80)
                .padding(EdgeInsets(top: 10, leading: 32, bottom: 10, trailing: 10))
            
            Spacer()
            
            VStack(alignment: .center, spacing: 8) {
                Text(traveler.name)
                    .font(.subheading2Bold)
                
                Text("Traveler")
                    .font(.subheading2)
                
                PillView(
                    name: traveler.event.listing.name,
                    width: traveler.event.width)
            }
            .padding(EdgeInsets(top: 32, leading: 10, bottom: 32, trailing: 32))
        }
        .background(.white)
        .frame(width: 265, height: 125)
//        .shadow(color: .black.opacity(0.05), radius: 45, x: 20, y: 20)
//        .shadow(color: .black.opacity(0.05), radius: 20, x: -20, y: -20)
        .cornerRadius(8)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray.opacity(0.1))
        }
    }
}

#Preview {
    TravelerCard(traveler: Traveler.examples.last!)
}

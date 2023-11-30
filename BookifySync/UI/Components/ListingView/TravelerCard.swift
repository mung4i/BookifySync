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
            Image("traveler", bundle: .main)
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
                    name: traveler.event.title,
                    width: 130,
                    height: 31,
                    platform: traveler.event.platform)
            }
            .padding(EdgeInsets(top: 32, leading: 10, bottom: 32, trailing: 32))
        }
        .background(.white)
        .frame(width: 265, height: 125)
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

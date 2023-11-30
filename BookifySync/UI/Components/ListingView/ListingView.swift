//
//  ListingView.swift
//  BookifySync
//
//  Created by Martin Mungai on 20/11/2023.
//

import SwiftUI

struct ListingView: View {
    init(
        action: @escaping Action = {},
        traveler: Traveler
    ) {
        self.action = action
        self.traveler = traveler
    }
    
    let action: Action
    let traveler: Traveler

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Traveler's details:")
                .font(.subheading2)
            
            TravelerCard(traveler: traveler)
            
            Spacer()
            
            TravelerDetailsCard(traveler: traveler)
            
        }
        .background(.white)
        .padding(.all, 16)
        .frame(width: 330, height: 389)
        .cornerRadius(8)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray.opacity(0.1))
        }
        .overlay {
            VStack {
                HStack {
                    Spacer()
                    Button(action: action) {
                        Image("cancel", bundle: .main)
                    }
                }
                .padding([.top, .trailing], -16)
                
                Spacer()
            }
        }
        
    }
}

#Preview {
    ListingView(traveler: Traveler.examples.last!)
}

//
//  TravelerDetailsCard.swift
//  BookifySync
//
//  Created by Martin Mungai on 20/11/2023.
//

import SwiftUI

struct TravelerDetailsCard: View {
    let traveler: Traveler
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("\(traveler.name)'s Details")
                .font(.subheading1)
                .padding(.horizontal, 16)
            
            HStack(alignment: .center) {
                Text("Guests:")
                    .font(.subheading2Bold)
                
                Spacer()
                
                Text(traveler.guests)
                    .font(.subheading2)
            }
            .padding(.horizontal, 16)
            
            HStack(alignment: .center) {
                VStack(alignment: .center, spacing: 8) {
                    Text("Check in:")
                        .font(.body2)
                        .frame(width: .infinity)
                    
                    CheckOutView(date: traveler.event.startDate)
                }
                
                Spacer()
                
                
                Divider()
                    .padding(.vertical, 16)
                
                VStack(alignment: .center, spacing: 8) {
                    Text("Check-out:")
                        .font(.body2)
                    
                    CheckOutView(date: traveler.event.endDate)
                }
                
                Spacer()
            }
            .padding(.all, 16)
            
        }
        .frame(width: 265, height: 158)
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
    TravelerDetailsCard(traveler: Traveler.examples.first!)
}

struct CheckOutView: View {
    let date: Date
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            Image(systemName: "calendar")
            
            Text(date.formatDateWithoutNewline("d MMM yyyy"))
                .font(.body3)
                .frame(width: .infinity)
        }
    }
}

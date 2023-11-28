//
//  PillView.swift
//  BookifySync
//
//  Created by Martin Mungai on 19/11/2023.
//

import SwiftUI

struct PillView: View {
    init(
    action: @escaping Action = {},
    name: String,
    width: CGFloat = 150,
    height: CGFloat = 45
    ) {
        self.action = action
        self.name = name
        self.width = width
        self.height = height
    }
    
    let action: Action
    let name: String
    let width: CGFloat
    let height: CGFloat
    
    private var pillImage: Image {
        switch name {
        case "Airbnb":
            return Image("airbnb-logo", bundle: .main)
        case "Booking.com":
            return Image("booking", bundle: .main)
        default:
            return Image(systemName: "b.circle")
        }
    }
    
    private var titleColor: Color {
        switch name {
        case "Airbnb":
            return .red
        case "Booking.com":
            return .blue
        default:
            return .green
        }
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Button(action: action) {
                HStack(spacing: 4) {
                    pillImage
                        .resizable()
                        .frame(width: 25, height: 25)
                    
                    Text(name)
                        .foregroundColor(.white)
                        .font(.body1)
                }
                
            }
            .frame(width: width, height: height)
        }
        .background(
            Capsule()
                .fill(titleColor)
        )
        .clipped()
    }
}

#Preview {
    Group {
        PillView(
            action: {},
            name: "Booking.com"
        )
        
        PillView(
            action: {},
            name: "Airbnb"
        )
        
        PillView(
            action: {},
            name: "Other Bookings"
        )
    }
}

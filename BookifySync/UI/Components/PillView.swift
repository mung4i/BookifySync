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
    color: Color = .red,
    image: String = "",
    name: String,
    width: CGFloat = 150,
    height: CGFloat = 45
    ) {
        self.action = action
        self.color = color
        self.image = image
        self.name = name
        self.width = width
        self.height = height
    }
    
    let action: Action
    let color: Color
    let image: String
    let name: String
    let width: CGFloat
    let height: CGFloat
    
    private var pillImage: Image {
        if image == "" {
            return Image(systemName: "b.circle")
        }
        
        return Image(image, bundle: .main)
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
        .background(color)
        .cornerRadius(height / 2)
        .overlay {
            RoundedRectangle(cornerRadius: height / 2)
                .stroke(Color.gray.opacity(0.1))
        }
    }
}

#Preview {
    Group {
        PillView(
            action: {},
            color: Color.blue.opacity(0.8),
            image: "booking",
            name: "Booking.com"
        )
        
        PillView(
            action: {},
            color: .red,
            image: "airbnb-logo",
            name: "Airbnb"
        )
        
        PillView(
            action: {},
            color: Color.blue.opacity(0.8),
            image: "",
            name: "Other Bookings"
        )
    }
}

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
    height: CGFloat = 45,
    platform: Platform
    ) {
        self.action = action
        self.name = name
        self.width = width
        self.height = height
        self.platform = platform
    }
    
    let action: Action
    let name: String
    let width: CGFloat
    let height: CGFloat
    let platform: Platform
    
    private var pillImage: Image {
        switch platform {
        case .airbnb:
            return Image("airbnb-logo", bundle: .main)
        case .booking:
            return Image("booking", bundle: .main)
        case .others:
            return Image("others", bundle: .main)
        case .tripitaca:
            return Image("tripitaca", bundle: .main)
        }
    }
    
    private var titleColor: Color {
        switch platform {
        case .airbnb:
            return .secondaryRed
        case .booking:
            return .primaryBlue
        case .others:
            return .primaryGreen
        case .tripitaca:
            return .primaryRed
        }
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Button(action: action) {
                HStack(spacing: 4) {
                    pillImage
                        .resizable()
                        .frame(width: 17, height: 17)
                    
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
            name: "Booking.com",
            platform: .booking
        )
        
        PillView(
            action: {},
            name: "Airbnb",
            platform: .airbnb
        )
        
        PillView(
            action: {},
            name: "Other Bookings",
            platform: .others
        )
    }
}

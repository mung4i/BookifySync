//
//  CalendarSectionView.swift
//  BookifySync
//
//  Created by Martin Mungai on 29/11/2023.
//

import SwiftUI

struct CalendarSectionView: View {
    init(
        sectionTitle: String = "",
        width: CGFloat = 50,
        height: CGFloat = 88,
        hasEvent: Bool = false,
        backgroundColor: Color = .white
    ) {
        self.sectionTitle = sectionTitle
        self.width = width
        self.height = height
        self.hasEvent = hasEvent
        self.backgroundColor = backgroundColor
    }
    
    let sectionTitle: String
    let width: CGFloat
    let height: CGFloat
    let hasEvent: Bool
    let backgroundColor: Color
    
    private var font: Font {
        .subheading2
    }
    
    private var eventText: some View {
        Text(sectionTitle)
            .font(.body1)
            .foregroundColor(.backgroundBlack)
            .strikethrough(color: .fadedBlack)
            .padding(.top, 15)
            .background {
                Circle()
                    .fill(Color.strokeBlack)
                    .frame(width: 36, height: 36)
                    .padding(.top)
            }
    }
    
    
    
    var body: some View {
        
        VStack(alignment: .center) {
            if hasEvent {
                eventText
            } else {
                Text(sectionTitle)
                    .font(.body1)
                    .foregroundColor(.backgroundBlack)
                    .padding(.top, 15)
            }
            
            Spacer()
        }
        .font(font)
        .foregroundColor(.black)
        .background(.clear)
        .frame(width: width, height: height)
        .padding(.zero)
        .border(Color.gray, width: 0.5)
    }
}

#Preview {
    CalendarSectionView(sectionTitle: "28", hasEvent: true)
}

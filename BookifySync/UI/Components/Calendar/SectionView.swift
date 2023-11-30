//
//  SectionView.swift
//  BookifySync
//
//  Created by Martin Mungai on 18/11/2023.
//

import SwiftUI

struct SectionView: View {
    init(
        action: @escaping Action = {},
        sectionTitle: String = "",
        width: CGFloat = 100,
        height: CGFloat = 60,
        isTitleBold: Bool = false,
        backgroundColor: Color = .white,
        showTitle: Bool = true
    ) {
        self.action = action
        self.sectionTitle = sectionTitle
        self.width = width
        self.height = height
        self.isTitleBold = isTitleBold
        self.backgroundColor = backgroundColor
        self.showTitle = showTitle
    }
    
    let action: Action
    let sectionTitle: String
    let width: CGFloat
    let height: CGFloat
    let isTitleBold: Bool
    let backgroundColor: Color
    let showTitle: Bool
    
    private var font: Font {
        isTitleBold ? .subheading2Bold: .subheading2
    }
    
    var body: some View {
        
        VStack(alignment: .center) {
            Text(showTitle ? sectionTitle : "")
        }
        .font(font)
        .foregroundColor(.black)
        .background(.clear)
        .frame(width: width, height: height)
        .padding(.zero)
        .border(Color.gray, width: 0.5)
        .onTapGesture(perform: action)
    }
}

#Preview {
    SectionView(action: {}, sectionTitle: "Listing")
}

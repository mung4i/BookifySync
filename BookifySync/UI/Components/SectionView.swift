//
//  SectionView.swift
//  BookifySync
//
//  Created by Martin Mungai on 18/11/2023.
//

import SwiftUI

struct SectionView: View {
    init(
        action: @escaping Action,
        sectionTitle: String,
        width: CGFloat = 100,
        height: CGFloat = 60,
        isTitleBold: Bool = false

    ) {
        self.action = action
        self.sectionTitle = sectionTitle
        self.width = width
        self.height = height
        self.isTitleBold = isTitleBold
    }
    
    let action: Action
    let sectionTitle: String
    let width: CGFloat
    let height: CGFloat
    let isTitleBold: Bool
    
    private var font: Font {
        isTitleBold ? .subheading2Bold: .subheading2
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(sectionTitle)
                .frame(alignment: .leading)
                .font(font)
                .foregroundColor(.black)
        }
        .frame(width: width, height: height)
        .fixedSize()
        .border(Color.gray, width: 0.5)
        .onTapGesture { action() }
    }
}

#Preview {
    SectionView(action: {}, sectionTitle: "Listing")
}

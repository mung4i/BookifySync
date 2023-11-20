//
//  HeaderView.swift
//  BookifySync
//
//  Created by Martin Mungai on 18/11/2023.
//

import Foundation
import SwiftUI

struct HeaderView: View {
    init(
        action: @escaping Action = {},
        title: String = "",
        imageTitle: String = "",
        imageDimension: CGFloat = 20
    ) {
        self.action = action
        self.title = title
        self.imageTitle = imageTitle
        self.imageDimension = imageDimension
    }
    
    let action: Action
    let title: String
    let imageTitle: String
    let imageDimension: CGFloat
    
    var body: some View {
        HStack(alignment: .center) {
            Text(title)
                .font(.headingRegular)
            
            Spacer()
            
            Image(imageTitle, bundle: .main)
                .resizable()
                .frame(width: imageDimension, height: imageDimension)
                .onTapGesture {
                    action()
                }
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    HeaderView(title: "Calendar", imageTitle: "filter")
}

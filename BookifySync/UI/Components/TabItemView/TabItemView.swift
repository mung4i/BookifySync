//
//  TabItemView.swift
//  BookifySync
//
//  Created by Martin Mungai on 27/11/2023.
//

import SwiftUI

struct TabItemView<Content: View>: View {
    let content: Content
    let imageTitle: String
    let title: String
    
    init(
        @ViewBuilder content: () -> Content,
        imageTitle: String,
        title: String
    ) {
        self.content = content()
        self.imageTitle = imageTitle
        self.title = title
    }
    
    var body: some View {
        content
            .tabItem {
                VStack {
                    Image(imageTitle)
                    Text(title)
                        .font(.headingRegular)
                }
            }
    }
}

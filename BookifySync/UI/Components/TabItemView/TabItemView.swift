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
    let isSelected: Bool
    let title: String
    
    init(
        @ViewBuilder content: () -> Content,
        imageTitle: String,
        isSelected: Bool = false,
        title: String
    ) {
        self.content = content()
        self.imageTitle = imageTitle
        self.isSelected = isSelected
        self.title = title
    }
    
    var body: some View {
        content
            .tabItem {
                VStack {
                    Image(imageTitle)
                        .renderingMode(.template)
                        .tint(isSelected ? Color.primaryRed : .backgroundGray)
                    Text(title)
                        .font(.headingRegular)
                }
            }
    }
}

#Preview {
    Group {
        TabView {
            TabItemView(
                content: { Text("Messages") },
                imageTitle: "messages",
                isSelected: true,
                title: "Messages")
        }
        .accentColor(.primaryRed)
    }
}

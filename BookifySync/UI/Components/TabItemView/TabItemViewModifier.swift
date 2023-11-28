//
//  TabItemViewModifier.swift
//  BookifySync
//
//  Created by Martin Mungai on 27/11/2023.
//

import SwiftUI

struct TabItemViewModifier: ViewModifier {
    let imageTitle: String
    let title: String
    
    func body(content: Content) -> some View {
        TabItemView(
            content: { content },
            imageTitle: imageTitle,
            title: title)
    }
}

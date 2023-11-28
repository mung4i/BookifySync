//
//  TabItemViewModifier.swift
//  BookifySync
//
//  Created by Martin Mungai on 27/11/2023.
//

import SwiftUI

struct TabItemViewModifier: ViewModifier {
    let imageTitle: String
    let isSelected: Bool
    let title: String
    
    func body(content: Content) -> some View {
        TabItemView(
            content: { content },
            imageTitle: imageTitle,
            isSelected: isSelected,
            title: title)
    }
}

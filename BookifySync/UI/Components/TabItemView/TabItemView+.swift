//
//  TabItemView+.swift
//  BookifySync
//
//  Created by Martin Mungai on 27/11/2023.
//

import SwiftUI

extension View {
    func tabItem(
        imageTitle: String,
        isSelected: Bool = false,
        title: String
    ) -> some View {
        modifier(TabItemViewModifier(
            imageTitle: imageTitle,
            isSelected: isSelected,
            title: title))
    }
}

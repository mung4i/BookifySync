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
        title: String
    ) -> some View {
        modifier(TabItemViewModifier(
            imageTitle: imageTitle,
            title: title))
    }
}

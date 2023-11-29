//
//  PillViewModifier.swift
//  BookifySync
//
//  Created by Martin Mungai on 27/11/2023.
//

import SwiftUI

struct PillViewModifier: ViewModifier {
    let action: Action
    let name: String
    let width: CGFloat
    let height: CGFloat
    let padding: CGFloat
    let isHidden: Bool
    let platform: Platform
    
    func body(content: Content) -> some View {
        content.overlay {
            PillView(
                action: action,
                name: name,
                width: width,
                height: height,
                platform: platform)
            .zIndex(10)
            .padding(.leading, padding)
            .opacity(isHidden ? 0 : 1)
        }
    }
}

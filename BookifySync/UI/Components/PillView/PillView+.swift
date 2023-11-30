//
//  PillView+.swift
//  BookifySync
//
//  Created by Martin Mungai on 27/11/2023.
//

import SwiftUI

extension View {
    func pillView(
        action: @escaping Action,
        name: String,
        width: CGFloat,
        height: CGFloat = 45,
        isHidden: Bool = false,
        platform: Platform,
        padBottom: Bool = false
    ) -> some View {
        modifier(
            PillViewModifier(
                action: action,
                name: name,
                width: width,
                height: height,
                isHidden: isHidden,
                platform: platform,
                padBottom: padBottom)
        )
    }
}

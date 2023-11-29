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
        padding: CGFloat = 25,
        isHidden: Bool = false,
        platform: Platform
    ) -> some View {
        modifier(
            PillViewModifier(
                action: action,
                name: name,
                width: width,
                height: height,
                padding: padding,
                isHidden: isHidden,
                platform: platform)
        )
    }
}

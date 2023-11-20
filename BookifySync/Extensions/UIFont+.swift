//
//  UIFont+.swift
//  BookifySync
//
//  Created by Martin Mungai on 19/11/2023.
//

import UIKit

extension UIFont {
    static func registerFont(
        bundle: Bundle,
        fontName: String,
        fontExtension: String
    ) -> Bool {

        guard let fontURL = bundle.url(
            forResource: fontName,
            withExtension: fontExtension
        ) else {
            fatalError("Couldn't find font \(fontName)")
        }

        guard let fontDataProvider = CGDataProvider(
            url: fontURL as CFURL
        ) else {
            fatalError("Couldn't load data from the font \(fontName)")
        }

        guard let font = CGFont(fontDataProvider) else {
            fatalError("Couldn't create font from data")
        }

        var error: Unmanaged<CFError>?
        return CTFontManagerRegisterGraphicsFont(font, &error)
    }
}

//
//  Font+.swift
//  BookifySync
//
//  Created by Martin Mungai on 19/11/2023.
//

import SwiftUI

public extension Font {

    // MARK: - Body 1

    /**
     * The font used for `Body 1` elements.
     */
    static let body1 = regular(size: 14.0)

    /**
     * The medium variant font used for `Body 1` elements.
     */
    static let body1Medium = medium(size: 14.0)

    /**
     * The bold variant font used for `Body 1` elements.
     */
    static let body1Bold = bold(size: 14.0)

    // MARK: - Body 2

    /**
     * The font used for `Body 2` elements.
     */
    static let body2 = regular(size: 12.0)

    /**
     * The medium variant font used for `Body 2` elements.
     */
    static let body2Medium = medium(size: 12.0)

    /**
     * The bold variant font used for `Body 2` elements.
     */
    static let body2Bold = bold(size: 12.0)

    // MARK: - Body 3

    /**
     * The font used for `Body 3` elements.
     */
    static let body3 = regular(size: 10.0)

    /**
     * The bold variant font used for `Body 3` elements.
     */
    static let body3Bold = bold(size: 10.0)

    // MARK: - Button

    /**
     * The font used for large `Button` elements.
     */
    static let buttonLarge = bold(size: 20.0)

    /**
     * The font used for small `Button` elements.
     */
    static let buttonSmall = bold(size: 12.0)
    
    // MARK: - Headline

    /**
     * The font used for `HeadlineRegular` elements.
     */
    static let headlineRegular = regular(size: 26.0)

    /**
     * The bold variant font used for `Headline` elements.
     */
    static let headlineBold = bold(size: 26.0)

    // MARK: - Heading

    /**
     * The font used for `Heading` elements.
     */
    static let headingRegular = regular(size: 22.0)

    /**
     * The bold variant font used for `Heading` elements.
     */
    static let headingBold = bold(size: 22.0)
    
    // MARK: - Large

    /**
     * The font used for `Large` elements.
     */
    static let large = bold(size: 32.0)
    
    // MARK: - LargeRegular

    /**
     * The font used for `LargeRegular` elements.
     */
    static let largeRegular = regular(size: 32.0)
    
    // MARK: - Link

    /**
     * The font used for default `Link` elements.
     */
    static let link = bold(size: 14.0)

    /**
     * The font used for small `Link` elements.
     */
    static let linkSmall = bold(size: 12.0)
    
    // MARK: - Subheading 1

    /**
     * The font used for `Subheading 1` elements.
     */
    static let subheading1 = regular(size: 18.0)

    /**
     * The bold variant font used for `Subheading 1` elements.
     */
    static let subheading1Bold = bold(size: 18.0)

    // MARK: - Subheading 2

    /**
     * The font used for `Subheading 2` elements.
     */
    static let subheading2 = regular(size: 16.0)

    /**
     * The bold variant font used for `Subheading 2` elements.
     */
    static let subheading2Bold = bold(size: 16.0)
}


// ----------------------------------------
// MARK: - VisionBank Custom Initializers
// ----------------------------------------


public extension Font {
    
    static func bold(size: CGFloat) -> Font {
        Font.custom("Poppins-Bold", size: size)
    }
    
    static func medium(size: CGFloat) -> Font {
        Font.custom("Poppins-Medium", size: size)
    }
    
    static func regular(size: CGFloat) -> Font {
        Font.custom("Poppins-Regular", size: size)
    }
    
    static func semiBold(size: CGFloat) -> Font {
        Font.custom("Poppins-SemiBold", size: size)
    }
    
    
}

//
//  CalendarCell.swift
//  BookifySync
//
//  Created by Martin Mungai on 20/11/2023.
//

import SwiftUI

struct CalendarCell: View {
    init(
        day: String,
        width: CGFloat = 50,
        height: CGFloat = 88,
        showTitle: Bool = true
    
    ) {
        self.day = day
        self.width = width
        self.height = height
        self.showTitle = showTitle
    }
    
    let day: String
    let width: CGFloat
    let height: CGFloat
    let showTitle: Bool
    
    var body: some View {
        CalendarSectionView(
            sectionTitle: day,
            width: width,
            height: height,
            hasEvent: showTitle)
    }
}

#Preview {
    CalendarCell(day: "28")
}

//
//  CalendarCell.swift
//  BookifySync
//
//  Created by Martin Mungai on 20/11/2023.
//

import SwiftUI

struct CalendarCell: View {
    let day: String
    let width: CGFloat = 50
    let height: CGFloat = 75
    
    var body: some View {
        SectionView(
            sectionTitle: day,
            width: width,
            height: height)
    }
}

#Preview {
    CalendarCell(day: "1")
}

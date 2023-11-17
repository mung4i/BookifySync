//
//  SectionView.swift
//  BookifySync
//
//  Created by Martin Mungai on 18/11/2023.
//

import SwiftUI

struct SectionContentView: View {
    let actions: [Action]
    let numberOfColumns = 3
    let sections: [Listing]

    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: Array(repeating: GridItem(),
                               count: numberOfColumns),
                spacing: 10
            ) {
                ForEach(
                    Array(sections.enumerated()), id: \.offset) { index, section in
                        SectionView(action: actions[index], sectionTitle: section.name)
                }
            }
        }
        .padding()
    }
}

#Preview {
    let listings: [Listing] = [
        Listing(name: "All"),
        Listing(name: "Seaside Cottage"),
        Listing(name: "Mali Apartments"),
        Listing(name: "Lui Homes"),
        Listing(name: "City View"),
        Listing(name: "Zuri Homes"),
    ]
    
    let actions: [Action] = [
        {},
        {},
        {},
        {},
        {},
        {},
    ]
    
    return SectionContentView(actions: actions, sections: listings)
}

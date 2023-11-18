//
//  SectionView.swift
//  BookifySync
//
//  Created by Martin Mungai on 18/11/2023.
//

import SwiftUI

struct SectionContentView: View {
    let actions: [Action]
    let endDate: Date
    let events: [Event]
    let sections: [Listing]
    let startDate: Date
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top) {
                VStack(spacing: 0) {
                    ForEach(Array(sections.enumerated()), id: \.offset) { index, section in
                        SectionView(action: actions[index], sectionTitle: section.name)
                    }
                }
            
                VStack(spacing: 0) {
                    CalendarListView(startDate: startDate, endDate: endDate, events: events)
                    
                    Spacer()
                }
                .padding(.top, -16)
                .padding(.leading, -23)
                
                
            }
            .frame(height: CGFloat(sections.count) * 60)
        .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    let startDate = Date()
    let endDate = Calendar.current.date(byAdding: .year, value: 1, to: Date())!
    let events = [
        Event(date: Date(), title: "Event 1"),
        Event(date: Calendar.current.date(byAdding: .day, value: 2, to: Date())!, title: "Event 2"),
        Event(date: Calendar.current.date(byAdding: .day, value: 3, to: Date())!, title: "Event 3"),
        // Add more events as needed
    ]
    
    let listings: [Listing] = [
        Listing(name: "Listings"),
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
    
    return SectionContentView(actions: actions, endDate: endDate, events: events, sections: listings, startDate: startDate)
}

//
//  SectionView.swift
//  BookifySync
//
//  Created by Martin Mungai on 18/11/2023.
//

import SwiftUI

struct SectionContentView: View {
    init(
        actions: [Action] = generateActions(count: Listing.examples.count),
        endDate: Date = Date.advanceDate(component: .year),
        events: [Event] = Event.examples,
        sections: [Listing] = Listing.examples,
        startDate: Date = Date()
    ) {
        self.actions = actions
        self.endDate = endDate
        self.events = events
        self.sections = sections
        self.startDate = startDate
    }
    
    let actions: [Action]
    let endDate: Date
    let events: [Event]
    let sections: [Listing]
    let startDate: Date
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            Grid(horizontalSpacing: 0, verticalSpacing: 0) {
                HStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        SectionView(
                            action: {},
                            sectionTitle: "Listings",
                            width: 150,
                            height: 100)
                        
                        ForEach(Array(sections.enumerated()), id: \.offset) { index, section in
                            SectionView(
                                action: actions[index],
                                sectionTitle: section.name,
                                width: 150)
                        }
                    }
                    
                    VStack(spacing: 0) {
                        CalendarListView(
                            startDate: startDate,
                            endDate: endDate,
                            events: events,
                            height: 100)
                        
                        grid()
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .cornerRadius(8)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray.opacity(0.4))
            }
        }
    }
    
    private func grid() -> some View {
        ForEach(Array(sections.enumerated()), id: \.offset) { parentIndex, parentSection in
            Grid(horizontalSpacing: 0, verticalSpacing: 0) {
                GridRow {
                    ForEach(Array(getDateRange().enumerated()), id: \.offset) { index, section in
                        let event = events
                        SectionView(action: getActions()[index], sectionTitle: "")
                    }
                }
            }
        }
    }
    
    private func getDateRange() -> [Date] {
        var currentDate = startDate
        var dates: [Date] = []
        
        while currentDate <= endDate {
            dates.append(currentDate)
            currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate)!
        }
        
        return dates
    }
    
    private func getActions() -> [Action] {
        var actions: [Action] = []
        
        for _ in getDateRange() {
            actions.append({})
        }
        
        return actions
    }
}

#Preview {
    SectionContentView()
}

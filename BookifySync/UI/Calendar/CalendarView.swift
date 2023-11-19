//
//  CalendarView.swift
//  BookifySync
//
//  Created by Martin Mungai on 17/11/2023.
//

import Foundation
import SwiftUI

struct CalendarView: View {
    
    let listings: [Listing]
    
    let actions: [Action]
    let endDate: Date
    let events: [Event]
    let startDate: Date
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 16) {
            HeaderView(action: {})
                .padding(.top, 32)
            
            DropDownView(listings: listings)
                .frame(width: 280)
            
            SectionContentView(
                actions: actions,
                endDate: endDate,
                events: events,
                sections: listings,
                startDate: startDate
            )
            .padding()
            
            Spacer()
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
    
    let actions: [Action] = [
        {},
        {},
        {},
        {},
        {},
        {},
    ]
    
    let listings: [Listing] = [
        Listing(name: "Listings"),
        Listing(name: "Seaside Cottage"),
        Listing(name: "Mali Apartments"),
        Listing(name: "Lui Homes"),
        Listing(name: "City View"),
        Listing(name: "Zuri Homes"),
    ]
    
    return CalendarView(
        listings: listings,
        actions: actions,
        endDate: endDate,
        events: events,
        startDate: startDate
    )
}

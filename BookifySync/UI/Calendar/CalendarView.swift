//
//  CalendarView.swift
//  BookifySync
//
//  Created by Martin Mungai on 17/11/2023.
//

import Foundation
import SwiftUI

struct CalendarView: View {
    init(
        dropdownListings: [Listing] = Listing.dropdownListings,
        listings: [Listing] = Listing.examples,
        actions: [Action] = generateActions(count: Listing.dropdownListings.count),
        endDate: Date = Date.advanceDate(component: .year),
        events: [Event] = Event.examples,
        startDate: Date = Date()
    ) {
        self.dropdownListings = dropdownListings
        self.listings = listings
        self.actions = actions
        self.endDate = endDate
        self.events = events
        self.startDate = startDate
    }
    
    let dropdownListings: [Listing]
    let listings: [Listing]
    let actions: [Action]
    let endDate: Date
    let events: [Event]
    let startDate: Date
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HeaderView(action: {})
                .padding(.top, 32)
            
            DropDownView(listings: dropdownListings)
                .frame(width: 280)
                .opacity(1)
                .zIndex(10)
            
            SectionContentView(
                actions: actions,
                endDate: endDate,
                events: events,
                sections: listings,
                startDate: startDate
            )
            .padding(.leading, 16)
            .padding(.bottom, 200)
        }
    }
}

#Preview {
    CalendarView()
}

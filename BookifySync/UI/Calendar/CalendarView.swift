//
//  CalendarView.swift
//  BookifySync
//
//  Created by Martin Mungai on 17/11/2023.
//

import ComposableArchitecture
@preconcurrency import SwiftUI

struct CalendarView: View {
    init(
        dropdownListings: [Listing] = Listing.dropdownListings,
        listings: [Listing] = Listing.examples,
        actions: [Action] = generateActions(count: Listing.dropdownListings.count),
        endDate: Date = Date.advanceDate(component: .year),
        startDate: Date = Date(),
        store: StoreOf<CalendarReducer> = Store(
            initialState: CalendarReducer.State(calendars: .mock)
        ) {
            CalendarReducer()
        }
    ) {
        self.dropdownListings = dropdownListings
        self.listings = listings
        self.actions = actions
        self.endDate = endDate
        self.startDate = startDate
        self.store = store
    }
    
    let store: StoreOf<CalendarReducer>
    let dropdownListings: [Listing]
    let listings: [Listing]
    let actions: [Action]
    let endDate: Date
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

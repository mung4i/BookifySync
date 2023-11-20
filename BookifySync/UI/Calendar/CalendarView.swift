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
        actions: [Action] = generateActions(count: Listing.dropdownListings.count),
        endDate: Date = Date.advanceDate(component: .year),
        startDate: Date = Date(),
        store: StoreOf<CalendarReducer> = Store(
            initialState: CalendarReducer.State(
                calendars: .mock,
                dropdown: .mock)
        ) {
            CalendarReducer()
        }
    ) {
        self.actions = actions
        self.endDate = endDate
        self.startDate = startDate
        self.store = store
    }
    
    let store: StoreOf<CalendarReducer>
    let actions: [Action]
    let endDate: Date
    let startDate: Date
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack(alignment: .leading, spacing: 0) {
                HeaderView(action: {})
                    .padding(.top, 32)
                
                DropDownView()
                    .frame(width: 280)
                    .opacity(1)
                    .zIndex(10)
                
                BookingsView(
                    actions: actions,
                    endDate: endDate,
                    startDate: startDate
                )
                .padding(.leading, 16)
                .padding(.bottom, 200)
            }
        }
    }
}

#Preview {
    CalendarView()
}

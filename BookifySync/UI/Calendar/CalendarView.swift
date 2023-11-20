//
//  CalendarView.swift
//  BookifySync
//
//  Created by Martin Mungai on 17/11/2023.
//

import ComposableArchitecture
import SwiftUI

struct CalendarView: View {
    init(
        actions: [Action] = generateActions(count: Listing.dropdownListings.count),
        endDate: Date = Date.advanceDate(component: .year),
        startDate: Date = Date(),
        store: StoreOf<CalendarReducer> = Store(
            initialState: CalendarReducer.State(
                calendars: .mock,
                dropdown: DropdownReducer.mock)
        ) {
            CalendarReducer()._printChanges()
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
    
    struct ViewState: Equatable {
        @BindingViewState var filter: FilterKey
        
        init(store: BindingViewStore<CalendarReducer.State>) {
            self._filter = store.$filter
        }
    }
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack(alignment: .leading, spacing: 16) {
                HeaderView(title: "Calendar", imageTitle: "filter")
                    .padding(.top, 32)
                
                IfLetStore(
                    self.store.scope(
                        state: \.dropdown,
                        action: { .dropdown($0) }
                    )
                ) { store in
                    DropDownView(store: store)
                        .frame(width: 280)
                        .opacity(1)
                        .zIndex(10)
                }
                
                if viewStore.$filter.wrappedValue == .all {
                    BookingsView(
                        actions: actions,
                        endDate: endDate,
                        startDate: startDate
                    )
                    .padding(.leading, 16)
                    .padding(.bottom, 200)
                } else {
                    CalendarGridView(sectionIndex: viewStore.$filter.wrappedValue.index)
                        .padding(.leading, 16)
                        .padding(.bottom, 160)
                }
            }
        }
    }
}

#Preview {
    CalendarView()
}

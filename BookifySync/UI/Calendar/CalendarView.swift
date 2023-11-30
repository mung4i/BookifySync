//
//  CalendarView.swift
//  BookifySync
//
//  Created by Martin Mungai on 17/11/2023.
//

import ComposableArchitecture
import SwiftUI

struct CalendarView: View {
    init(store: StoreOf<CalendarReducer>) {
        self.store = store
    }
    
    let store: StoreOf<CalendarReducer>
    let endDate = Date.advanceDate(component: .year)
    let startDate = Date()
    
    struct ViewState: Equatable {
        @BindingViewState var filter: FilterKey?
        @BindingViewState var event: Event?
        
        init(store: BindingViewStore<CalendarReducer.State>) {
            self._filter = store.$filter
            self._event = store.$event
        }
    }
    
    @State var showFilterView: Bool = false
    
    var body: some View {
        WithViewStore(self.store, observe: ViewState.init) { viewStore in
            NavigationView {
                VStack(alignment: .leading, spacing: 11) {
                    HeaderView(
                        action: { showFilterView.toggle() },
                        title: "Calendar",
                        imageTitle: "filter")
                    .padding(.top, 30)
                    .padding(.trailing, 16)
                    
                    if showFilterView {
                        NavigationLink(
                            destination: filterView(),
                            isActive: $showFilterView)
                        { EmptyView() }
                    }
                    
                    if let filter = viewStore.filter {
                        if filter == .all {
                            bookingView()
                        } else {
                            calendarView(filter.index)
                        }
                    }
                }
                .onAppear {
                    viewStore.send(.setFilterState(.all))
                }
                .overlay {
                    if let event = viewStore.event {
                        ListingView(
                            action: { viewStore.send(.booking(.showBooking(nil))) },
                            traveler: Traveler(name: event.title, event: event)
                        )
                        .background(.white)
                    }
                }
                .padding(.leading, 16)
                .navigationBarBackButtonHidden()
            }
        }
    }
    
    private func bookingView() -> some View {
        IfLetStore(
            self.store.scope(
                state: \.booking,
                action: { .booking($0) }
            )
        ) { store in
            CalendarBookingsView(store: store)
        }
    }
    
    private func calendarView(_ index: Int) -> some View {
        IfLetStore(
            self.store.scope(
                state: \.calendars,
                action: { .showCalendarView($0) }
            )
        ) { store in
            CalendarGridView(
                sectionIndex: index,
                store: store
            )
        }
    }
    
    private func filterView() -> some View {
        IfLetStore(
            self.store.scope(
                state: \.filterPlatforms,
                action: { .toggleFilters($0) })
        ) { store in
            FilterView(store: store)
        }
    }
}

#Preview {
    CalendarView(store: CalendarReducer.mockStore())
}

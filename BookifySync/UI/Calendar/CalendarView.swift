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
    @State private var selectedTab: TabSelectionState = .calendar
    
    var body: some View {
        WithViewStore(self.store, observe: ViewState.init) { viewStore in
            NavigationView {
                VStack(alignment: .leading, spacing: 0) {
                    HeaderView(action: { showFilterView.toggle() }, title: "Calendar", imageTitle: "filter")
                    
                    if $showFilterView.wrappedValue {
                        NavigationLink(
                            destination: IfLetStore(
                                self.store.scope(
                                    state: \.filterPlatforms,
                                    action: { .toggleFilters($0) })) { store in
                                        FilterView(store: store)
                                    },
                            isActive: $showFilterView)
                        { EmptyView() }
                    }
                    
                    Spacer()
                        .frame(maxHeight: 16)
                    
                    Spacer()
                        .frame(maxHeight: 16)
                    
                    if let filter = viewStore.filter {
                        if filter == .all {
                            IfLetStore(
                                self.store.scope(
                                    state: \.booking,
                                    action: { .booking($0) }
                                )
                            ) { store in
                                CalendarBookingsView(store: store)
                                    .padding(.leading, 16)
                            }
                        } else {
                            IfLetStore(
                                self.store.scope(
                                    state: \.calendars,
                                    action: { .showCalendarView($0) }
                                )
                            ) { store in
                                CalendarGridView(
                                    sectionIndex: filter.index,
                                    store: store
                                )
                            }
                        }
                    }
                    
                    
                    Spacer()
                }
                .onAppear {
                    viewStore.send(.setFilterState(.all))
                }
                .overlay {
                    if let event = viewStore.$event.wrappedValue {
                        ListingView(
                            action: { viewStore.send(.booking(.showBooking(nil))) },
                            traveler: Traveler(name: event.title, event: event)
                        )
                        .background(.white)
                    }
                }
                .navigationBarBackButtonHidden()
            }
        }
    }
}

#Preview {
    CalendarView(store: CalendarReducer.mockStore())
}

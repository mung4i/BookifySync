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
    
    enum TabSelectionState: Int, CaseIterable {
        case messages
        case offers
        case calendar
        case bookings
        case menu
    }
    
    struct ViewState: Equatable {
        @BindingViewState var filter: FilterKey
        @BindingViewState var event: Event?
        
        init(store: BindingViewStore<CalendarReducer.State>) {
            self._filter = store.$filter
            self._event = store.$event
        }
    }
    
    @State var showFilterView: Bool = false
    @State private var selectedTab: TabSelectionState = .calendar
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            TabView(selection: $selectedTab) {
                Text("Messages")
                    .tabItem(
                        imageTitle: "messages",
                        title: "Messages")
                
                Text("Offers")
                    .tabItem(
                        imageTitle: "gift",
                        title: "Offers")
                
                NavigationView {
                    VStack(alignment: .leading, spacing: 16) {
                        if $showFilterView.wrappedValue {
                            NavigationLink(destination: FilterView(), isActive: $showFilterView) { EmptyView() }
                        }
                        
                        HeaderView(action: { showFilterView.toggle() }, title: "Calendar", imageTitle: "filter")
                            .padding(.top, 32)
                        
                        IfLetStore(
                            self.store.scope(
                                state: \.dropdown,
                                action: { .dropdown($0) }
                            )
                        ) { store in
                            DropDownView(store: store)
                                .padding(.top, 16)
                                .frame(width: 280)
                                .opacity(1)
                                .zIndex(10)
                        }
                        
                        if viewStore.filter == .all {
                            IfLetStore(
                                self.store.scope(
                                    state: \.booking,
                                    action: { .booking($0) }
                                )
                            ) { store in
                                BookingsView(store: store)
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
                                    sectionIndex: viewStore.$filter.wrappedValue.index,
                                    store: store
                                )
                                .padding(.leading, 16)
                            }
                        }
                        
                        Spacer()
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
                .tabItem(
                    imageTitle: "calendar",
                    title: "Calendar")
                
                Text("Bookings")
                    .tabItem(
                        imageTitle: "bookings",
                        title: "Bookings")
                
                Text("Menu")
                    .tabItem(
                        imageTitle: "menu",
                        title: "Menu")
            }
            .accentColor(.primaryRed)
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    CalendarView(
        store: Store(
            initialState: CalendarReducer.State(
                calendars: CalendarGridReducer.State(filter: .all),
                dropdown: DropdownReducer.mock,
                booking: BookingsReducer.State(event: nil)
            )
        ) {
            CalendarReducer()._printChanges()
        }
    )
}

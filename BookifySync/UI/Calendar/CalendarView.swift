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
                calendars: CalendarGridReducer.State(filter: .all),
                dropdown: DropdownReducer.mock,
                booking: BookingsReducer.State(event: nil)
            )
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
        @BindingViewState var event: Event?
        
        init(store: BindingViewStore<CalendarReducer.State>) {
            self._filter = store.$filter
            self._event = store.$event
        }
    }
    
    @State var showFilterView: Bool = false
    @State private var selectedTab: Int = 2
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            TabView(selection: $selectedTab) {
                Text("Messages")
                    .tabItem {
                        Image("messages")
                        Text("Messages")
                    }
                
                Text("Offers")
                    .tabItem {
                        Image("gift")
                        Text("Offers")
                    }
                
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
                                .frame(width: 280)
                                .opacity(1)
                                .zIndex(10)
                        }
                        
                        if viewStore.$filter.wrappedValue == .all {
                            IfLetStore(
                                self.store.scope(
                                    state: \.booking,
                                    action: { .booking($0) }
                                )
                            ) { store in
                                BookingsView(store: store)
                                    .padding(.leading, 16)
                                    .padding(.bottom, 100)
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
                                .padding(.bottom, 100)
                            }
                        }
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
                .tabItem {
                    Image("calendar")
                    Text("Calendar")
                        .font(.headingRegular)
                }
                
                Text("Bookings")
                    .tabItem {
                        Image("bookings")
                        Text("Bookings")
                            .font(.headingRegular)
                    }
                
                Text("Menu")
                    .tabItem {
                        Image("menu")
                        Text("Menu")
                            .font(.headingRegular)
                    }
            }
            .accentColor(.primaryRed)
            .navigationBarBackButtonHidden()
        }.onAppear {
            selectedTab = 2
        }

    }
}

#Preview {
    CalendarView()
}

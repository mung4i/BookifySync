//
//  Calendar.swift
//  BookifySync
//
//  Created by Martin Mungai on 20/11/2023.
//

import ComposableArchitecture

@Reducer
struct CalendarReducer {
    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case dropdown(DropdownReducer.Action)
        case showCalendarView(CalendarGridReducer.Action)
        case booking(BookingsReducer.Action)
        case toggleFilters(FilterReducer.Action)
        case setFilterState(FilterKey)
    }
    
    struct State: Equatable {
        @BindingState var filter: FilterKey?
        @BindingState var event: Event?
        @BindingState var platforms: [Platforms] = Platforms
            .allCases
            .map { $0 }
        
        var calendars: CalendarGridReducer.State?
        var dropdown: DropdownReducer.State?
        var booking: BookingsReducer.State?
        var filterPlatforms: FilterReducer.State?
    }
    
    var body: some Reducer<State, Action> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .binding:
                return .none
                
            case let .booking(.showBooking(event)):
                state.event = event
                return .none
                
            case let .dropdown(.filterTapped(filter)):
                state.filter = filter
                return .none
                
            case let .setFilterState(key):
                state.filter = key
                return .none
                
            case let .showCalendarView(.booking(event)):
                state.event = event
                return .none
                
            case .showCalendarView(.showCalendarGrid):
                return .none
                
            case .toggleFilters(.checkBoxTapped):
                state.platforms = state.filterPlatforms?.platform ?? []
                return .none
                
            case .toggleFilters(.clear):
                return .none
            }
        }
//        .ifLet(\.filterPlatforms, action: \.toggleFilters) {
//            FilterReducer()
//        }
//        .ifLet(\.dropdown, action: \.dropdown) {
//            DropdownReducer()
//        }
//        .ifLet(\.booking, action: \.booking) {
//            BookingsReducer()
//        }
//        .ifLet(\.calendars, action: \.showCalendarView) {
//            CalendarGridReducer()
//        }
    }
}

extension CalendarReducer {
    static func mockStore() -> StoreOf<CalendarReducer> {
        Store(
            initialState: CalendarReducer.State(
                calendars: .init(),
                dropdown: DropdownReducer.mock,
                booking: .init(),
                filterPlatforms: .init(platform: [])
            )
        ) {
            CalendarReducer()._printChanges()
        }
    }
}

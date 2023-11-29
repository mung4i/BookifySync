//
//  Calendar.swift
//  BookifySync
//
//  Created by Martin Mungai on 20/11/2023.
//

import ComposableArchitecture
import Foundation

@Reducer
struct CalendarReducer {
    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case booking(BookingsReducer.Action)
        case setFilterState(FilterKey)
        case showCalendarView(CalendarGridReducer.Action)
        case toggleFilters(FilterReducer.Action)
    }
    
    struct State: Equatable {
        @BindingState var allPlatforms: [Platforms] = Platforms.default
        @BindingState var event: Event?
        @BindingState var filter: FilterKey?
        @BindingState var selectedPlatforms: [Platforms: Bool] = Platforms.defaultState
        
        var calendars: CalendarGridReducer.State?
        var booking: BookingsReducer.State?
        var filterPlatforms: FilterReducer.State?
    }
    
    var body: some Reducer<State, Action> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .binding:
                return .none
                
            case let .booking(.dropdown(.filterTapped(filter))):
                state.filter = filter
                if filter != .all {
                    state.calendars?.dropDown = .init(filter: filter, id: .init())
                }
                return .none
                
            case let .booking(.showBooking(event)):
                state.event = event
                return .none
                
            case let .setFilterState(key):
                state.filter = key
                
                let dropdownState = DropdownReducer.State(filter: key, id: UUID())
                
                if state.booking == nil {
                    state.booking = .init(dropdown: dropdownState)
                } else {
                    state.booking?.dropdown?.filter = key
                }
                
                if state.calendars == nil {
                    state.calendars = .init(filter: key, dropDown: dropdownState)
                }
                
                state.calendars?.filter = key
                
                if state.filterPlatforms == nil {
                    state.filterPlatforms = .init(
                        platform: Platforms.default,
                        filterState: Platforms.defaultState)
                }
                
                return .none
                
            case let .showCalendarView(.booking(event)):
                state.event = event
                return .none
                
            case let .showCalendarView(.dropdown(.filterTapped(filter))):
                state.filter = filter
                state.booking?.dropdown?.filter = filter
                state.calendars?.dropDown?.filter = filter
                return .none
                
            case .showCalendarView(.showCalendarGrid):
                return .none
                
            case .toggleFilters:
                if let selectedPlatforms = state.filterPlatforms?.filterState {
                    state.selectedPlatforms = selectedPlatforms
                    state.booking?.filterState = selectedPlatforms
                    state.calendars?.filterState = selectedPlatforms
                }
                return .none
            }
        }
        .ifLet(\.filterPlatforms, action: \.toggleFilters) {
            FilterReducer()
        }
        .ifLet(\.booking, action: \.booking) {
            BookingsReducer()
        }
        .ifLet(\.calendars, action: \.showCalendarView) {
            CalendarGridReducer()
        }
    }
}

extension CalendarReducer {
    static func mockStore() -> StoreOf<CalendarReducer> {
        Store(
            initialState: CalendarReducer.State()
        ) {
            CalendarReducer()._printChanges()
        }
    }
}

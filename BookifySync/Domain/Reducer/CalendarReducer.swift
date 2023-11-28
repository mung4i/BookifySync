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
                state.booking = .init(
                    dropdown: .init(filter: key, id: .init())
                )
                return .none
                
            case let .showCalendarView(.booking(event)):
                state.event = event
                return .none
                
            case let .showCalendarView(.dropdown(.filterTapped(filter))):
                state.filter = filter
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
            initialState: CalendarReducer.State(
                calendars: .init(),
                booking: .init(),
                filterPlatforms: .init(platform: [])
            )
        ) {
            CalendarReducer()._printChanges()
        }
    }
}

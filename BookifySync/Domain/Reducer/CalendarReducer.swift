//
//  Calendar.swift
//  BookifySync
//
//  Created by Martin Mungai on 20/11/2023.
//

import Foundation
import ComposableArchitecture

@Reducer
struct CalendarReducer {
    enum Action {
        case dropdown(DropdownReducer.Action)
        case showCalendarView(CalendarGridReducer.Action)
        case booking(BookingsReducer.Action)
    }
    
    struct State: Equatable {
        @BindingState var filter: FilterKey = .all
        @BindingState var event: Event?
        
        var calendars: CalendarGridReducer.State?
        var dropdown: DropdownReducer.State?
        var booking: BookingsReducer.State?
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
                
            case let .dropdown(.filterTapped(filter)):
                state.filter = filter
                return .none
                
            case let .showCalendarView(.booking(event)):
                state.event = event
                return .none
                
            case let .booking(.showBooking(event)):
                state.event = event
                return .none
                
            case .showCalendarView(.showCalendarGrid(_)):
                return .none
            }
        }
    }
}





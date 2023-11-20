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
        case showCalendarView(IdentifiedActionOf<CalendarGridReducer>)
    }
    
    struct State: Equatable {
        @BindingState var filter: FilterKey = .all
        
        var calendars: IdentifiedArrayOf<CalendarGridReducer.State> = []
        var dropdown: DropdownReducer.State?
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
                
            case let .dropdown(.filterTapped(filter)):
                state.filter = filter
                return .none
                
            case .showCalendarView(.element(_, _)):
                return .none
            }
        }
        .forEach(\.calendars, action: \.showCalendarView) {
            CalendarGridReducer()
        }
    }
}



//
//  CalendarGridReducer.swift
//  BookifySync
//
//  Created by Martin Mungai on 20/11/2023.
//

import ComposableArchitecture

@Reducer
struct CalendarGridReducer {
    enum Action {
        case showCalendarGrid(FilterKey)
        case booking(Event?)
        case dropdown(DropdownReducer.Action)
    }
    
    struct State: Equatable {
        @BindingState var filter: FilterKey?
        @BindingState var event: Event?
        @BindingState var filterState: [Platform: Bool] = Platform.defaultState
        
        var dropDown: DropdownReducer.State?
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case let .showCalendarGrid(key):
                state.filter = key
                return .none
                
            case let .booking(event):
                state.event = event
                return .none
                
            case let .dropdown(.filterTapped(filter)):
                state.filter = filter
                return .none
            }
        }
        .ifLet(\.dropDown, action: \.dropdown) {
            DropdownReducer()
        }
    }
}

//
//  BookingsReducer.swift
//  BookifySync
//
//  Created by Martin Mungai on 21/11/2023.
//

import ComposableArchitecture

@Reducer
struct BookingsReducer {
    enum Action {
        case dropdown(DropdownReducer.Action)
        case showBooking(Event?)
    }
    
    struct State: Equatable {
        @BindingState var event: Event?
        @BindingState var filter: FilterKey?
        
        var dropdown: DropdownReducer.State?
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            
            switch action {
                
            case let .dropdown(.filterTapped(filter)):
                state.filter = filter
                return .none
                
            case let .showBooking(event):
                state.event = event
                return .none
            }
        }
        .ifLet(\.dropdown, action: \.dropdown) {
            DropdownReducer()
        }
    }
}

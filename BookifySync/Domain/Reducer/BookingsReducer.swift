//
//  BookingsReducer.swift
//  BookifySync
//
//  Created by Martin Mungai on 21/11/2023.
//

import ComposableArchitecture
import Foundation

@Reducer
struct BookingsReducer {
    enum Action {
        case showBooking(Event?)
    }
    
    struct State: Equatable {
        @BindingState var event: Event?
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            
            switch action {
            case let .showBooking(event):
                state.event = event
                return .none
            }
        }
    }
}

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
    enum Action: BindableAction, Sendable {
        case binding(BindingAction<State>)
        case showCalendarView(FilterKey)
    }
    
    struct State: Equatable {
        @BindingState var filter: FilterKey = .all
        
        var calendars: IdentifiedArrayOf<ListingReducer.State> = []
    }
    
    var body: some Reducer<State, Action> {
        BindingReducer()
        Reduce { state, action in
            switch action {
                
            case .binding:
                return .none
                
            case let .showCalendarView(key):
                state.filter = key
                return .none
            }
        }
    }
}



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
        case dropdown(IdentifiedActionOf<DropdownReducer>)
        case showCalendarView(IdentifiedActionOf<ListingReducer>)
    }
    
    struct State: Equatable {
        @BindingState var filter: FilterKey = .all
        
        var calendars: IdentifiedArrayOf<ListingReducer.State> = []
        var dropdown: IdentifiedArrayOf<DropdownReducer.State> = []
    }
    
    var body: some Reducer<State, Action> {
        BindingReducer()
        Reduce { state, action in
            switch action {
                
            case .binding:
                return .none
                
            case let .dropdown(.element(_, action)):
                switch action {
                case let .filterTapped(filter):
                    state.filter = filter
                }
                return .none
                
            case let .showCalendarView(.element(_, action)):
                switch action {
                case let .listingTapped(filter):
                    state.filter = filter
                }
                return .none
            }
        }
        .forEach(\.dropdown, action: \.dropdown) {
            DropdownReducer()
        }
        .forEach(\.calendars, action: \.showCalendarView) {
            ListingReducer()
        }
    }
}



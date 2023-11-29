//
//  FilterReducer.swift
//  BookifySync
//
//  Created by Martin Mungai on 28/11/2023.
//

import ComposableArchitecture

@Reducer
struct FilterReducer {
    enum Action {
        case checkBoxTapped(Platforms)
        case clear
    }
    
    struct State: Equatable {
        @BindingState var platform: [Platforms] = Platforms.allCases.map { $0 }
        @BindingState var filterState: [Platforms: Bool] = Platforms.defaultState
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            
            switch action {
            case .clear:
                state.filterState = Platforms.defaultState
                return .none
            case let .checkBoxTapped(platform):
                if var platformFilterState = state.filterState[platform] {
                    state.filterState[platform] = !platformFilterState
                }
                return .none
            }
        }
    }
}

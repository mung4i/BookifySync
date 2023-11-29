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
        case checkBoxTapped(Platform)
        case clear
    }
    
    struct State: Equatable {
        @BindingState var platform: [Platform] = Platform.allCases.map { $0 }
        @BindingState var filterState: [Platform: Bool] = Platform.defaultState
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            
            switch action {
            case .clear:
                state.filterState = Platform.defaultState
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

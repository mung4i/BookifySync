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
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            
            switch action {
            case .clear:
                state.platform = []
                state.platform = Platforms.allCases.map { $0 }
                return .none
            case let .checkBoxTapped(platform):
                if state.platform.contains(platform) {
                    state.platform = state.platform.filter { $0 != platform }
                } else {
                    state.platform.append(platform)
                }
                return .none
            }
        }
    }
}

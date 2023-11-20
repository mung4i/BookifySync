//
//  TravelerReducer.swift
//  BookifySync
//
//  Created by Martin Mungai on 20/11/2023.
//

import Foundation
import ComposableArchitecture

@Reducer
struct TravelerReducer {
    enum Action {
        case dismiss
        case present
    }
    
    struct State: Equatable, Identifiable {
        @BindingState var traveler: Traveler
        let id: UUID
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .dismiss:
                return .none
            case .present:
                return .none
            }
            
        }
    }
}

extension IdentifiedArray where ID == TravelerReducer.State.ID, Element == TravelerReducer.State {
    static let mock: Self = [
        TravelerReducer.State(traveler: Traveler.examples.first!, id: UUID())
    ]
}

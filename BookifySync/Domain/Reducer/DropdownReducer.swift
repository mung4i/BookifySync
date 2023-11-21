//
//  DropdownReducer.swift
//  BookifySync
//
//  Created by Martin Mungai on 20/11/2023.
//

import Foundation
import ComposableArchitecture

@Reducer
struct DropdownReducer {
    enum Action {
        case filterTapped(FilterKey)
    }
    
    struct State: Equatable, Identifiable {
        @BindingState var filter: FilterKey = .all
        let id: UUID
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case let .filterTapped(filter):
                state.filter = filter
                return .none
            }
        }
    }
}

extension DropdownReducer {
    static let mock: DropdownReducer.State = .init(filter: .all, id: UUID())
}

extension IdentifiedArray where ID == DropdownReducer.State.ID, Element == DropdownReducer.State {
    static let mock: Self = [
        DropdownReducer.State(filter: .all, id: UUID()),
        DropdownReducer.State(filter: .seasideCottage, id: UUID()),
        DropdownReducer.State(filter: .maliApartments, id: UUID()),
        DropdownReducer.State(filter: .luiHomes, id: UUID()),
        DropdownReducer.State(filter: .cityView, id: UUID()),
        DropdownReducer.State(filter: .zuriHomes, id: UUID())
    ]
}

//
//  CalendarGridReducer.swift
//  BookifySync
//
//  Created by Martin Mungai on 20/11/2023.
//

import Foundation
import ComposableArchitecture

@Reducer
struct CalendarGridReducer {
    enum Action {
        case listingTapped(IdentifiedActionOf<TravelerReducer>)
        case showCalendarGrid(FilterKey)
    }
    
    struct State: Equatable, Identifiable {
        @BindingState var filter: FilterKey
        let id: UUID
        var travelers: IdentifiedArrayOf<TravelerReducer.State>
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case let .listingTapped(.element(_, action)):
                switch action {
                case .dismiss:
                    return .none
                case .present:
                    return .none
                }
            case let .showCalendarGrid(key):
                state.filter = key
                return .none
            }
        }
        .forEach(\.travelers, action: \.listingTapped) {
            TravelerReducer()
        }
    }
}

extension IdentifiedArray where ID == CalendarGridReducer.State.ID, Element == CalendarGridReducer.State {
    static let mock: Self = [
        CalendarGridReducer.State(filter: .seasideCottage, id: UUID(), travelers: .mock),
        CalendarGridReducer.State(filter: .maliApartments, id: UUID(), travelers: .mock),
        CalendarGridReducer.State(filter: .luiHomes, id: UUID(), travelers: .mock),
        CalendarGridReducer.State(filter: .cityView, id: UUID(), travelers: .mock),
        CalendarGridReducer.State(filter: .zuriHomes, id: UUID(), travelers: .mock)
    ]
}



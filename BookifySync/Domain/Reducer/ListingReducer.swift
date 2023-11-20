//
//  ListingReducer.swift
//  BookifySync
//
//  Created by Martin Mungai on 20/11/2023.
//

import Foundation
import ComposableArchitecture


@Reducer
struct ListingReducer {
    struct State: Equatable, Identifiable {
        @BindingState var description: FilterKey = .all
        let id: UUID
    }
    
    enum Action {
        case listingTapped(FilterKey)
      }

      var body: some Reducer<State, Action> {
          Reduce { state, action in
              switch action {
              case let .listingTapped(filter):
                  state.description = filter
                  return .none
              }
          }
      }
}

extension IdentifiedArray where ID == ListingReducer.State.ID, Element == ListingReducer.State {
    static let mock: Self = [
        ListingReducer.State(
            description: .seasideCottage,
            id: UUID()),
        ListingReducer.State(
            description: .maliApartments,
            id: UUID()),
        ListingReducer.State(
            description: .luiHomes,
            id: UUID()),
        ListingReducer.State(
            description: .cityView,
            id: UUID()),
        ListingReducer.State(
            description: .zuriHomes,
            id: UUID())
    ]
}



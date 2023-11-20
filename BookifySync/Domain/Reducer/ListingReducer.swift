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
        @BindingState var description = ""
        let id: UUID
    }
    
    enum Action: BindableAction, Sendable {
        case binding(BindingAction<State>)
      }

      var body: some Reducer<State, Action> {
        BindingReducer()
      }
}

extension IdentifiedArray where ID == ListingReducer.State.ID, Element == ListingReducer.State {
    static let mock: Self = [
        ListingReducer.State(
            description: FilterKey.seasideCottage.rawValue,
            id: UUID()),
        ListingReducer.State(
            description: FilterKey.maliApartments.rawValue,
            id: UUID()),
        ListingReducer.State(
            description: FilterKey.luiHomes.rawValue,
            id: UUID()),
        ListingReducer.State(
            description: FilterKey.cityView.rawValue,
            id: UUID()),
        ListingReducer.State(
            description: FilterKey.zuriHomes.rawValue,
            id: UUID())
    ]
}



//
//  FilterKey.swift
//  BookifySync
//
//  Created by Martin Mungai on 20/11/2023.
//

import Foundation

enum FilterKey: String, CaseIterable, Hashable {
    case all = "All"
    case seasideCottage = "Seaside Cottage"
    case maliApartments = "Mali Apartments"
    case luiHomes = "Lui Homes"
    case cityView = "City View"
    case zuriHomes = "Zuri Homes"
}

extension FilterKey {
    var index: Int {
        switch self {
        case .all:
            return 0
        case .seasideCottage:
            return 1
        case .maliApartments:
            return 2
        case .luiHomes:
            return 3
        case .cityView:
            return 4
        case .zuriHomes:
            return 5
        }
    }
}

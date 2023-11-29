//
//  Platforms.swift
//  BookifySync
//
//  Created by Martin Mungai on 20/11/2023.
//

import Foundation

enum Platforms: String, CaseIterable, Equatable {
    case tripitaca = "Tripitaca"
    case airbnb = "Airbnb"
    case booking = "Booking.com"
    case others = "Others"
}

extension Platforms {
    
    static var `default`: [Platforms] = Platforms
        .allCases
        .map { $0 }
    
    static var defaultState: [Platforms: Bool] {
        var dictionary = [Platforms: Bool]()
        for platform in Platforms.allCases {
            dictionary[platform] = true
        }
        return dictionary
    }
}


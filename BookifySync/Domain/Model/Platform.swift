//
//  Platform.swift
//  BookifySync
//
//  Created by Martin Mungai on 20/11/2023.
//

import Foundation

enum Platform: String, CaseIterable, Equatable {
    case airbnb = "Airbnb"
    case booking = "Booking.com"
    case others = "Others"
    case tripitaca = "Tripitaca"
}

extension Platform {
    
    static var `default`: [Platform] = Platform
        .allCases
        .map { $0 }
    
    static var defaultState: [Platform: Bool] {
        var dictionary = [Platform: Bool]()
        for platform in Platform.allCases {
            dictionary[platform] = true
        }
        return dictionary
    }
}


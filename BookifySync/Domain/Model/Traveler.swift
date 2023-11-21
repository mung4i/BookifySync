//
//  Traveler.swift
//  BookifySync
//
//  Created by Martin Mungai on 20/11/2023.
//

import Foundation

struct Traveler: Hashable{
    let name: String
    let event: Event
    let guests: String = "8 adults, 2 children"
}

extension Traveler {
    static var examples: [Traveler] {
        Event.examples.map({
            Traveler(name: $0.title, event: $0)
        })
    }
}

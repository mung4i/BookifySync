//
//  Listing.swift
//  BookifySync
//
//  Created by Martin Mungai on 18/11/2023.
//

import Foundation

struct Listing: Hashable {
    let id: Int
    let name: String
}

extension Listing {
    static var examples: [Listing] {
        [
            Listing(id: 1, name: "Seaside Cottage"),
            Listing(id: 2, name: "Mali Apartments"),
            Listing(id: 3, name: "Lui Homes"),
            Listing(id: 4, name: "City View"),
            Listing(id: 5, name: "Zuri Homes"),
        ]
    }
    
    static var dropdownListings: [Listing] {
        [
            Listing(id: 0, name: "All"),
            Listing(id: 1, name: "Seaside Cottage"),
            Listing(id: 2, name: "Mali Apartments"),
            Listing(id: 3, name: "Lui Homes"),
            Listing(id: 4, name: "City View"),
            Listing(id: 5, name: "Zuri Homes"),
        ]
    }
}

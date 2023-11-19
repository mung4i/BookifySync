//
//  Listing.swift
//  BookifySync
//
//  Created by Martin Mungai on 18/11/2023.
//

import Foundation

struct Listing: Hashable {
    let name: String
}

extension Listing {
    static var examples: [Listing] {
        [
            Listing(name: "Seaside Cottage"),
            Listing(name: "Mali Apartments"),
            Listing(name: "Lui Homes"),
            Listing(name: "City View"),
            Listing(name: "Zuri Homes"),
        ]
    }
    
    static var dropdownListings: [Listing] {
        [
            Listing(name: "All"),
            Listing(name: "Seaside Cottage"),
            Listing(name: "Mali Apartments"),
            Listing(name: "Lui Homes"),
            Listing(name: "City View"),
            Listing(name: "Zuri Homes"),
        ]
    }
}

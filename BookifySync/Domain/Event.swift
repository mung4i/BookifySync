//
//  Event.swift
//  BookifySync
//
//  Created by Martin Mungai on 18/11/2023.
//

import Foundation

struct Event: Identifiable {
    let id = UUID()
    let startDate: Date
    let endDate: Date
    let title: String
    let listing: Listing
}

extension Event {
    static var examples: [Event] {
        [
        Event(
            startDate: Date(),
            endDate: .advanceDate(value: 3),
            title: "Dakota David",
            listing: Listing(name: "Seaside Cottage")),
        
        Event(
            startDate: .advanceDate(value: 4),
            endDate: .advanceDate(value: 3, date: .advanceDate(value: 4)),
            title: "Dakota David",
            listing: Listing(name: "Seaside Cottage")),
        
        Event(
            startDate: Date(),
            endDate: .advanceDate(value: 4),
            title: "Asia Mkenya",
            listing: Listing(name: "Mali Apartment")),
        
        Event(
            startDate: .advanceDate(value: 4),
            endDate: .advanceDate(value: 4, date: .advanceDate(value: 4)),
            title: "Booking.com",
            listing: Listing(name: "Mali Apartments")),
        
        Event(
            startDate: .advanceDate(value: 15),
            endDate: .advanceDate(value: 3, date: .advanceDate(value: 15)),
            title: "Diana Dee",
            listing: Listing(name: "Mali Apartments")),
        
        Event(
            startDate: .advanceDate(value: 18),
            endDate: .advanceDate(value: 3, date: .advanceDate(value: 18)),
            title: "Martin John",
            listing: Listing(name: "Mali Apartments")),
        
        Event(
            startDate: .advanceDate(value: 22),
            endDate: .advanceDate(value: 6, date: .advanceDate(value: 22)),
            title: "Dakota David",
            listing: Listing(name: "Mali Apartments")),
        
        Event(
            startDate: .advanceDate(value: 30),
            endDate: .advanceDate(value: 2, date: .advanceDate(value: 30)),
            title: "Dakota David",
            listing: Listing(name: "Mali Apartments")),
        
        Event(
            startDate: Date(),
            endDate: .advanceDate(value: 3),
            title: "Dakota David",
            listing: Listing(name: "Lui Homes")),
        
        Event(
            startDate: .advanceDate(value: 4),
            endDate: .advanceDate(value: 3, date: .advanceDate(value: 4)),
            title: "Airbnb",
            listing: Listing(name: "Lui Homes")),
        
        Event(
            startDate: Date(),
            endDate: .advanceDate(value: 3),
            title: "Airbnb",
            listing: Listing(name: "City View")),
        
        Event(
            startDate: .advanceDate(value: 4),
            endDate: .advanceDate(value: 3, date: .advanceDate(value: 4)),
            title: "Other Booking",
            listing: Listing(name: "City View")),
        
        Event(
            startDate: Date(),
            endDate: .advanceDate(value: 3),
            title: "Booking.com",
            listing: Listing(name: "Zuri Homes")),
    ]
    }
}

//
//  Event.swift
//  BookifySync
//
//  Created by Martin Mungai on 18/11/2023.
//

import Foundation

struct Event: Hashable {
    let id = UUID()
    let startDate: Date
    let endDate: Date
    let title: String
    let listing: Listing
}

extension Date {
    func toDay() -> Int {
        self
            .formatDate("d")
            .toInt()
    }
    
    func toNumber(format: String = "MM") -> Int {
        self
            .formatDate(format)
            .toInt()
    }
}

private extension String {
    func toInt() -> Int {
        Int(self) ?? 1
    }
}

extension Event {
    private var difference: Int {
        let start = startDate.toDay()
        let end = endDate.toDay()
        return end - start
    }
    
    var width: CGFloat {
        return CGFloat(difference <= 0  ? 150 : 50 * difference)
    }
    
    var gridWidth: CGFloat {
        return CGFloat(difference <= 0  ? 75 : 50 * difference)
    }
    
    func showEvent(date: Date) -> Bool {
        if (date.toDay() >= startDate.toDay()) || (date.toDay() <= endDate.toDay()) {
            return true
        }
        return false
    }
}

extension Event {
    static var examples: [Event] {
        [
            Event(
                startDate: Date(),
                endDate: .advanceDate(value: 3),
                title: "Dakota David",
                listing: Listing(id: 1, name: "Seaside Cottage")),
            
            Event(
                startDate: .advanceDate(value: 4),
                endDate: .advanceDate(value: 3, date: .advanceDate(value: 4)),
                title: "Dakota David",
                listing: Listing(id: 1, name: "Seaside Cottage")),
            
            Event(
                startDate: Date(),
                endDate: .advanceDate(value: 4),
                title: "Asia Mkenya",
                listing: Listing(id: 2, name: "Mali Apartments")),
            
            Event(
                startDate: .advanceDate(value: 4),
                endDate: .advanceDate(value: 4, date: .advanceDate(value: 4)),
                title: "Booking.com",
                listing: Listing(id: 2, name: "Mali Apartments")),
            
            Event(
                startDate: .advanceDate(value: 15),
                endDate: .advanceDate(value: 3, date: .advanceDate(value: 15)),
                title: "Diana Dee",
                listing: Listing(id: 2, name: "Mali Apartments")),
            
            Event(
                startDate: .advanceDate(value: 18),
                endDate: .advanceDate(value: 3, date: .advanceDate(value: 18)),
                title: "Martin John",
                listing: Listing(id: 2, name: "Mali Apartments")),
            
            Event(
                startDate: .advanceDate(value: 22),
                endDate: .advanceDate(value: 6, date: .advanceDate(value: 22)),
                title: "Dakota David",
                listing: Listing(id: 2, name: "Mali Apartments")),
            
            Event(
                startDate: .advanceDate(value: 30),
                endDate: .advanceDate(value: 2, date: .advanceDate(value: 30)),
                title: "Dakota David",
                listing: Listing(id: 2, name: "Mali Apartments")),
            
            Event(
                startDate: Date(),
                endDate: .advanceDate(value: 3),
                title: "Dakota David",
                listing: Listing(id: 3, name: "Lui Homes")),
            
            Event(
                startDate: .advanceDate(value: 4),
                endDate: .advanceDate(value: 3, date: .advanceDate(value: 4)),
                title: "Airbnb",
                listing: Listing(id: 3, name: "Lui Homes")),
            
            Event(
                startDate: Date(),
                endDate: .advanceDate(value: 3),
                title: "Airbnb",
                listing: Listing(id: 4, name: "City View")),
            
            Event(
                startDate: .advanceDate(value: 4),
                endDate: .advanceDate(value: 3, date: .advanceDate(value: 4)),
                title: "Other Booking",
                listing: Listing(id: 4, name: "City View")),
            
            Event(
                startDate: Date(),
                endDate: .advanceDate(value: 3),
                title: "Booking.com",
                listing: Listing(id: 5, name: "Zuri Homes")),
        ]
    }
}

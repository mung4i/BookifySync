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
    let platform: Platforms
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

extension Sequence where Element == Event {
    func getEvent(
        dateIndex: Int,
        dates: [Date],
        sections: [Listing],
        sectionIndex: Int,
        platforms: [Platforms: Bool] = Platforms.defaultState
    ) -> Event? {
        let selection = self.filter { event in
            event.listing.id == sections[sectionIndex].id &&
            event.startDate.formatDate("d") == dates[dateIndex].formatDate("d")
        }.first
        
        if let selection, let state = platforms[selection.platform], state {
            return selection
        }
        
        return nil
    }
    
    func hasEvent(date: Date) -> Bool {
        filter {
            let startDate = $0.startDate.toDay()
            let endDate = $0.endDate.toDay()
            let day = date.toDay()
            
            if day > startDate && day <= endDate {
                return true
            }
            return false
        }.count == 0
    }
}

extension Event {
    static var examples: [Event] {
        [
            Event(
                startDate: Date(),
                endDate: .advanceDate(value: 3),
                title: "Dakota David",
                listing: Listing(id: 1, name: "Seaside Cottage"),
                platform: .others),
            
            Event(
                startDate: .advanceDate(value: 4),
                endDate: .advanceDate(value: 3, date: .advanceDate(value: 4)),
                title: "Dakota David",
                listing: Listing(id: 1, name: "Seaside Cottage"),
                platform: .others),
            
            Event(
                startDate: Date(),
                endDate: .advanceDate(value: 4),
                title: "Asia Mkenya",
                listing: Listing(id: 2, name: "Mali Apartments"),
                platform: .tripitaca),
            
            Event(
                startDate: .advanceDate(value: 4),
                endDate: .advanceDate(value: 4, date: .advanceDate(value: 4)),
                title: "Booking.com",
                listing: Listing(id: 2, name: "Mali Apartments"),
                platform: .booking),
            
            Event(
                startDate: .advanceDate(value: 15),
                endDate: .advanceDate(value: 3, date: .advanceDate(value: 15)),
                title: "Diana Dee",
                listing: Listing(id: 2, name: "Mali Apartments"),
                platform: .tripitaca),
            
            Event(
                startDate: .advanceDate(value: 18),
                endDate: .advanceDate(value: 3, date: .advanceDate(value: 18)),
                title: "Martin John",
                listing: Listing(id: 2, name: "Mali Apartments"),
                platform: .tripitaca),
            
            Event(
                startDate: .advanceDate(value: 22),
                endDate: .advanceDate(value: 6, date: .advanceDate(value: 22)),
                title: "Dakota David",
                listing: Listing(id: 2, name: "Mali Apartments"),
                platform: .others),
            
            Event(
                startDate: .advanceDate(value: 30),
                endDate: .advanceDate(value: 2, date: .advanceDate(value: 30)),
                title: "Dakota David",
                listing: Listing(id: 2, name: "Mali Apartments"),
                platform: .others),
            
            Event(
                startDate: Date(),
                endDate: .advanceDate(value: 3),
                title: "Dakota David",
                listing: Listing(id: 3, name: "Lui Homes"),
                platform: .others),
            
            Event(
                startDate: .advanceDate(value: 4),
                endDate: .advanceDate(value: 3, date: .advanceDate(value: 4)),
                title: "Airbnb",
                listing: Listing(id: 3, name: "Lui Homes"),
                platform: .airbnb),
            
            Event(
                startDate: Date(),
                endDate: .advanceDate(value: 3),
                title: "Airbnb",
                listing: Listing(id: 4, name: "City View"),
                platform: .airbnb),
            
            Event(
                startDate: .advanceDate(value: 4),
                endDate: .advanceDate(value: 3, date: .advanceDate(value: 4)),
                title: "Other Booking",
                listing: Listing(id: 4, name: "City View"),
                platform: .others),
            
            Event(
                startDate: Date(),
                endDate: .advanceDate(value: 3),
                title: "Booking.com",
                listing: Listing(id: 5, name: "Zuri Homes"),
                platform: .booking),
        ]
    }
}

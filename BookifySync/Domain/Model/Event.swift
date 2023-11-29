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
    let platform: Platform
}

extension Event {
    private var difference: Int {
        let start = startDate.toDay()
        let end = endDate.toDay()
        return end - start
    }
    
    var width: CGFloat {
        return CGFloat(difference <= 0  ? 100 : 100 * difference)
    }
    
    var gridWidth: CGFloat {
        return CGFloat(difference <= 0  ? 50 : 50 * difference)
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
        platforms: [Platform: Bool] = Platform.defaultState
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
    
    func hasEvent(date: Date, id: Int) -> Bool {
        filter {
            if ($0.listing.id == id) &&
                date.inRange(start: $0.startDate, end: $0.endDate) {
                return true
            }
            
            return false
        }.count > 0
    }
}

extension Date {
    func inRange(start: Date, end: Date) -> Bool {
        let minDate = min(start, end)
        let maxDate = max(start, end)
        return minDate <= self && self <= maxDate
    }
}

extension Event {
    
    private static var startDate: Date {
        .defaultDate
    }
    
    static var examples: [Event] {
        
        let event1StartDate = startDate
        let event1EndDate = Date.advanceDate(value: 3, date: event1StartDate)
        
        let event2StartDate = Date.advanceDate(value: 4, date: event1EndDate)
        let event2EndDate = Date.advanceDate(value: 3, date: event2StartDate)
        
        let event3StartDate = startDate
        let event3EndDate = Date.advanceDate(value: 4, date: event3StartDate)
        
        let event4StartDate = Date.advanceDate(value: 4, date: event3EndDate)
        let event4EndDate = Date.advanceDate(value: 4, date: event4StartDate)
        
        let event5StartDate = Date.advanceDate(value: 15, date: startDate)
        let event5EndDate = Date.advanceDate(value: 3, date: event5StartDate)
        
        let event6StartDate = Date.advanceDate(value: 19, date: startDate)
        let event6EndDate = Date.advanceDate(value: 2, date: event6StartDate)
        
        let event7StartDate = Date.advanceDate(value: 22, date: startDate)
        let event7EndDate = Date.advanceDate(value: 3, date: event7StartDate)
        
        let event8StartDate = Date.advanceDate(value: 30, date: startDate)
        let event8EndDate = Date.advanceDate(value: 2, date: event8StartDate)
        
        let event9StartDate = startDate
        let event9EndDate = Date.advanceDate(value: 2, date: event9StartDate)
        
        let event10StartDate = Date.advanceDate(value: 4, date: startDate)
        let event10EndDate = Date.advanceDate(value: 3, date: event9StartDate)
        
        let event11StartDate = startDate
        let event11EndDate = Date.advanceDate(value: 3, date: event11StartDate)
        
        let event12StartDate = Date.advanceDate(value: 4, date: startDate)
        let event12EndDate = Date.advanceDate(value: 3, date: event12StartDate)
        
        let event13StartDate = startDate
        let event13EndDate = Date.advanceDate(value: 3, date: event12StartDate)  

        return [
            Event(
                startDate: event1StartDate,
                endDate: event1EndDate,
                title: "Dakota David",
                listing: Listing(id: 1, name: "Seaside Cottage"),
                platform: .others),
            
            Event(
                startDate: event2StartDate,
                endDate: event2EndDate,
                title: "Dakota David",
                listing: Listing(id: 1, name: "Seaside Cottage"),
                platform: .others),
            
            Event(
                startDate: event3StartDate,
                endDate: event3EndDate,
                title: "Asia Mkenya",
                listing: Listing(id: 2, name: "Mali Apartments"),
                platform: .tripitaca),
            
            Event(
                startDate: event4StartDate,
                endDate: event4EndDate,
                title: "Booking.com",
                listing: Listing(id: 2, name: "Mali Apartments"),
                platform: .booking),
            
            Event(
                startDate: event5StartDate,
                endDate: event5EndDate,
                title: "Diana Dee",
                listing: Listing(id: 2, name: "Mali Apartments"),
                platform: .tripitaca),
            
            Event(
                startDate: event6StartDate,
                endDate: event6EndDate,
                title: "Martin John",
                listing: Listing(id: 2, name: "Mali Apartments"),
                platform: .tripitaca),
            
            Event(
                startDate: event7StartDate,
                endDate: event7EndDate,
                title: "Dakota David",
                listing: Listing(id: 2, name: "Mali Apartments"),
                platform: .others),
            
            Event(
                startDate: event8StartDate,
                endDate: event8EndDate,
                title: "Dakota David",
                listing: Listing(id: 2, name: "Mali Apartments"),
                platform: .others),
            
            Event(
                startDate: event9StartDate,
                endDate: event9EndDate,
                title: "Dakota David",
                listing: Listing(id: 3, name: "Lui Homes"),
                platform: .others),
            
            Event(
                startDate: event10StartDate,
                endDate: event10EndDate,
                title: "Airbnb",
                listing: Listing(id: 3, name: "Lui Homes"),
                platform: .airbnb),
            
            Event(
                startDate: event11StartDate,
                endDate: event11EndDate,
                title: "Airbnb",
                listing: Listing(id: 4, name: "City View"),
                platform: .airbnb),
            
            Event(
                startDate: event12StartDate,
                endDate: event12EndDate,
                title: "Other Booking",
                listing: Listing(id: 4, name: "City View"),
                platform: .others),
            
            Event(
                startDate: event13StartDate,
                endDate: event13EndDate,
                title: "Booking.com",
                listing: Listing(id: 5, name: "Zuri Homes"),
                platform: .booking),
        ]
    }
}

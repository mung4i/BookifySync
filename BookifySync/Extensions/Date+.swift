//
//  Date+.swift
//  BookifySync
//
//  Created by Martin Mungai on 18/11/2023.
//

import Foundation

extension Date {
    
    static var defaultDate: Date {
        // Set the desired date components
        var dateComponents = DateComponents()
        dateComponents.year = 2023
        dateComponents.month = 11
        dateComponents.day = 1

        // Create a calendar
        let calendar = Calendar.current
        return calendar.date(from: dateComponents) ?? Date()
    }
    
    static func advanceDate(
        component: Calendar.Component = .day,
        value: Int = 1,
        date: Date = Date()
    ) -> Date {
        Calendar.current.date(
            byAdding: component,
            value: value,
            to: date)!
    }
    
    func formatDateWithoutNewline(_ format: String = "") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        let date: String = dateFormatter.string(from: self)
        return date
    }
    
    func formatDate(_ format: String = "E d") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        let date: String = dateFormatter.string(from: self)
        return date.addNewLineAfterSpace()
    }
        
    func getDates(start: Date, endDate: Date) -> [Date] {
        var dates: [Date] = []
        var currentDate = start

        while currentDate <= endDate {
            dates.append(currentDate)
            currentDate = Date.advanceDate(date: currentDate)
        }

        return dates
    }
    
    func toDay() -> Int {
        toNumber(format: "d")
    }
    
    func toNumber(format: String = "MM") -> Int {
        formatDate(format)
            .toInt()
    }
}

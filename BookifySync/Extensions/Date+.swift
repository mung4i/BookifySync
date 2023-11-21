//
//  Date+.swift
//  BookifySync
//
//  Created by Martin Mungai on 18/11/2023.
//

import Foundation

extension Date {
    
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
}

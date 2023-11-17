//
//  Date+.swift
//  BookifySync
//
//  Created by Martin Mungai on 18/11/2023.
//

import Foundation

extension Date {
    
    func formatDate(_ format: String = "E d") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        let date: String = dateFormatter.string(from: self)
        return date.addNewLineAfterSpace()
    }
}

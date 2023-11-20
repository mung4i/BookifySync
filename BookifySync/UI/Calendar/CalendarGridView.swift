//
//  CalendarGridView.swift
//  BookifySync
//
//  Created by Martin Mungai on 20/11/2023.
//

import SwiftUI

struct CalendarGridView: View {
    private let calendar = Calendar.current
    private let currentDate = Date()
    
    let days: [String] = [
        "SAT",
        "SUN",
        "MON",
        "TUE",
        "WED",
        "THU",
        "FRI"
    ]
    
    var body: some View {
        Grid(horizontalSpacing: 0, verticalSpacing: 0) {
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    ForEach(0..<7, id: \.self) { index in
                        CalendarCell(day: days[index])
                    }
                }
                
                LazyVGrid(columns: Array(repeating: GridItem(.fixed(50), spacing: 0), count: 7), spacing: 0) {
                    ForEach(daysInMonth(), id: \.self) { day in
                        CalendarCell(day: day.formatDate("d"))
                    }
                }
            }
        }
    }
    
    
    private func daysInMonth() -> [Date] {
        guard let monthRange = calendar.range(of: .day, in: .month, for: currentDate) else {
            return []
        }
        
        return monthRange.compactMap { day in
            calendar.date(byAdding: .day, value: day - 1, to: firstDayOfMonth())
        }
    }
    
    // Function to get the first day of the month
    private func firstDayOfMonth() -> Date {
        guard let firstDay = calendar.date(from: calendar.dateComponents([.year, .month], from: currentDate)) else {
            return currentDate
        }
        
        return firstDay
    }
}

#Preview {
    CalendarGridView()
}

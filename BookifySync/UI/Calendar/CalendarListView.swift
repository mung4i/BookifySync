//
//  CalendarListView.swift
//  BookifySync
//
//  Created by Martin Mungai on 18/11/2023.
//

import SwiftUI

struct CalendarListView: View {
    let startDate: Date
    let endDate: Date
    let events: [Event]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(getDateRange(), id: \.self) { date in
                    VStack(alignment: .center) {
                        Text(date.formatDate().uppercased())
                            .font(.headline)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 4)

//                        ForEach(getEvents(for: date)) { event in
//                            Text(event.title)
//                                .foregroundColor(.blue)
//                                .padding(.horizontal, 8)
//                        }
                    }
                    .frame(width: 100, height: 150)
                    .border(Color.gray, width: 0.5)
                }
            }
        }
        .padding()
    }

    private func getDateRange() -> [Date] {
        var currentDate = startDate
        var dates: [Date] = []

        while currentDate <= endDate {
            dates.append(currentDate)
            currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate)!
        }

        return dates
    }

    private func getEvents(for date: Date) -> [Event] {
        return events.filter { Calendar.current.isDate($0.date, inSameDayAs: date) }
    }
}

#Preview {
    
    let startDate = Date()
    let endDate = Calendar.current.date(byAdding: .year, value: 1, to: Date())!
    let events = [
        Event(date: Date(), title: "Event 1"),
        Event(date: Calendar.current.date(byAdding: .day, value: 2, to: Date())!, title: "Event 2"),
        Event(date: Calendar.current.date(byAdding: .day, value: 3, to: Date())!, title: "Event 3"),
        // Add more events as needed
    ]
    
    
    return CalendarListView(startDate: startDate, endDate: endDate, events: events)
}

 

//
//  CalendarListView.swift
//  BookifySync
//
//  Created by Martin Mungai on 18/11/2023.
//

import SwiftUI

struct CalendarListView: View {
    init(
        startDate: Date = Date(),
        endDate: Date = Date.advanceDate(component: .year),
        events: [Event] = Event.examples,
        width: CGFloat = 100,
        height: CGFloat = 60
    ) {
        self.startDate = startDate
        self.endDate = endDate
        self.events = events
        self.width = width
        self.height = height
    }
    
    let startDate: Date
    let endDate: Date
    let events: [Event]
    let width: CGFloat
    let height: CGFloat

    var body: some View {
        HStack(spacing: 0) {
            ForEach(getDateRange(), id: \.self) { date in
                VStack(alignment: .center) {
                    Text(date.formatDate().uppercased())
                        .font(.headline)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 4)
                        .frame(width: width, height: height)
                }
                .background(Color.backgroundGray)
                .frame(width: width, height: height)
                .border(Color.gray, width: 0.5)
            }
        }
    }

    private func getDateRange() -> [Date] {
        Date.now.getDates(
            start: startDate,
            endDate: endDate)
    }
}

#Preview {
    return CalendarListView()
}

 

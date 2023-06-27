//
//  TimeView.swift
//  Pacer Watch App
//
//  Created by Artem Martirosyan on 27.06.2023.
//

import SwiftUI

struct TimeView: View {
    @State private var time = Calendar.current.startOfDay(for: Date())
    
    var dateRange: ClosedRange<Date> {
        let calendar = Calendar.current
        
        // Get the current date and extract its components
        let currentDate = Date()
        let currentComponents = calendar.dateComponents([.year, .month, .day], from: currentDate)
        
        // Create the minimum date components for the starting time (0:00:00)
        var minDateComponents = DateComponents()
        
        var maxDateComponents = DateComponents()
        maxDateComponents.calendar = calendar
        maxDateComponents.year = currentComponents.year
        maxDateComponents.month = currentComponents.month
        maxDateComponents.day = currentComponents.day
        maxDateComponents.hour = 6
        maxDateComponents.minute = 59
        maxDateComponents.second = 59
        
        // Create the minimum and maximum dates
        guard let minDate = calendar.date(from: minDateComponents),
              let maxDate = calendar.date(from: maxDateComponents) else {
            fatalError("Invalid date components")
        }
        
        // Return the date range
        return minDate...maxDate
    }
    
    var body: some View {
        VStack {
            DatePicker("Choose Finish Time", selection: $time, in: dateRange, displayedComponents: [.hourMinuteAndSecond])
            NavigationLink(destination: SplitsView(pace: Pace.allPaces[0], distance: Distance.allCases[0])) {
                Text("To splits")
            }
        }
    }
}

#Preview {
    TimeView()
}

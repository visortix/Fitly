//
//  CalendarViewModel.swift
//  Fitly
//
//  Created by visortix on 09.02.2026.
//

import SwiftUI

@Observable class CalendarViewModel {
    
    var calendar = WeekCalendar.init()
    
    func represent(day: DayOfWeek) -> String {
        let day = day.rawValue
        let string = isFirstCalendarDay(day: day) ? day : String(day.first ?? "⚠️")
        
        return string.capitalized
    }
    
    func update() {
        
        let currentDay = Date().dayOfWeek()
        
        if let currentDay {
            while !isFirstCalendarDay(day: currentDay) {
                let day = daysOfWeek.removeFirst()
                daysOfWeek.append(day)
            }
        }
    }
    
    func isFirstCalendarDay(day: String) -> Bool {
        
        let firstCalendarDay = daysOfWeek.first?.rawValue
        
        if let firstCalendarDay {
            return day == firstCalendarDay
        }
        return false
    }
    
    func isFirstCalendarDay(day: DayOfWeek) -> Bool {
        isFirstCalendarDay(day: day.rawValue)
    }
    
    func isTrainingDay(day: DayOfWeek) -> Bool {
        trainingDays.contains(day)
    }
}

extension CalendarViewModel {
    
    var daysOfWeek: [DayOfWeek] {
        get { calendar.daysOfWeek }
        set { calendar.daysOfWeek = newValue }
    }
    
    var trainingDays: [DayOfWeek] {
        get { calendar.trainingDays }
        set { calendar.trainingDays = newValue }
    }
}



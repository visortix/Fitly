//
//  Date+dayOfWeek.swift
//  Fitly
//
//  Created by visortix on 09.02.2026.
//

import Foundation

extension Date {
    func dayNumberOfWeek() -> Int? {
        Calendar.current.dateComponents([.weekday], from: self).weekday
    }
}

extension Date {
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).lowercased()
    }
}

//
//  Date+dayOfWeek.swift
//  Fitly
//
//  Created by visortix on 09.02.2026.
//

import Foundation

extension Date {
    var dayOfWeek: String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).lowercased()
    }
}

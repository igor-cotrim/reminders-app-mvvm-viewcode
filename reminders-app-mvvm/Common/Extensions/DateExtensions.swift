//
//  NumberExtensions.swift
//  reminders-app-mvvm
//
//  Created by Igor Cotrim on 25/10/24.

import UIKit

extension Date {
    func formatToLongFormatWithHour(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, h:mm a"
        let formattedDate = dateFormatter.string(from: date)
        
        return formattedDate
    }
}

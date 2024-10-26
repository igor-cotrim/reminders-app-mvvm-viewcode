//
//  ReminderCellViewModel.swift
//  reminders-app-mvvm
//
//  Created by Igor Cotrim on 25/10/24.
//
import Foundation

final class ReminderCellViewModel {
    private let reminder: Reminder
    
    init(reminder: Reminder) {
        self.reminder = reminder
    }
    
    func getTitle() -> String {
        return reminder.title
    }
    
    func getLimitDate() -> String {
        return reminder.dateLimit.formatToLongFormatWithHour(date: reminder.dateLimit)
    }
    
    func getNotes() -> String? {
        return reminder.note
    }
    
    func getIsCompleted() -> Bool {
        return reminder.isCompleted
    }
}

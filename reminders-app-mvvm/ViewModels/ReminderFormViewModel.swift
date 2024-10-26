//
//  ReminderFormViewModel.swift
//  reminders-app-mvvm
//
//  Created by Igor Cotrim on 25/10/24.
//
import Foundation

class ReminderFormViewModel {
    var title: String = ""
    var note: String = ""
    var dateLimit: Date = Date()
    
    func addReminder(to remindersListViewModel: RemindersListViewModel) {
        let newReminder = Reminder(
            title: title,
            dateLimit: dateLimit,
            note: note,
            isCompleted: false
        )
        
        remindersListViewModel.addReminder(newReminder)
    }
}

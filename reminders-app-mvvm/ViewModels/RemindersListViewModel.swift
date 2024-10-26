//
//  RemindersListViewModel.swift
//  reminders-app-mvvm
//
//  Created by Igor Cotrim on 25/10/24.
//

final class RemindersListViewModel {
    var reminders = Reminder.data {
        didSet {
            didUpdateReminders?()
        }
    }
    
    var didUpdateReminders: (() -> Void)?
    var didSelectReminder: ((Reminder) -> Void)?
    
    func numberOfRemindrs() -> Int {
        return reminders.count
    }
    
    func getReminder(at row: Int) -> Reminder {
        return reminders[row]
    }
    
    func toggleReminder(at row: Int) {
        reminders[row].isCompleted.toggle()
    }
    
    func addReminder(_ reminder: Reminder) {
        reminders.insert(reminder, at: 0)
    }
    
    func deleteReminder(at index: Int) {
        reminders.remove(at: index)
    }
    
    func selectReminder(at index: Int) {
        let selectedReminder = reminders[index]
        didSelectReminder?(selectedReminder)
    }
}

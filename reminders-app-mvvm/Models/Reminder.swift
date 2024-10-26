//
//  Reminder.swift
//  reminders-app-mvvm
//
//  Created by Igor Cotrim on 25/10/24.
//

import Foundation

struct Reminder {
    var title: String
    var dateLimit: Date
    var note: String? = nil
    var isCompleted: Bool = false
}

extension Reminder {
    static var data: [Reminder] = [
        Reminder(title: "Fazer curso de Swift", dateLimit: Date().addingTimeInterval(9000), isCompleted: false),
        Reminder(title: "Fazer curso de TS", dateLimit: Date().addingTimeInterval(1000), isCompleted: false),
        Reminder(title: "Fazer curso de JS", dateLimit: Date().addingTimeInterval(80), isCompleted: true),
        Reminder(title: "Fazer curso de Go", dateLimit: Date().addingTimeInterval(4000), isCompleted: false),
        Reminder(title: "Fazer curso de Go", dateLimit: Date().addingTimeInterval(4000), isCompleted: false),
        Reminder(title: "Fazer curso de Go", dateLimit: Date().addingTimeInterval(4000), isCompleted: false),
        Reminder(title: "Fazer curso de Go", dateLimit: Date().addingTimeInterval(4000), isCompleted: false),
        Reminder(title: "Fazer curso de Go", dateLimit: Date().addingTimeInterval(4000), isCompleted: false),
        Reminder(title: "Fazer curso de Go", dateLimit: Date().addingTimeInterval(4000), isCompleted: false),
        Reminder(title: "Fazer curso de Go", dateLimit: Date().addingTimeInterval(4000), isCompleted: false),
    ]
}

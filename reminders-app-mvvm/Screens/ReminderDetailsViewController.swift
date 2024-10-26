//
//  RemindersDetailsViewController.swift
//  reminders-app-mvvm
//
//  Created by Igor Cotrim on 25/10/24.
//
import UIKit


class ReminderDetailsViewController: UIViewController {
    private let reminder: Reminder
    
    init(reminder: Reminder) {
        self.reminder = reminder
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = reminder.title
        setupView()
    }
    
    private func setupView() {
        // Configurar UI para exibir detalhes, como título e data do reminder
        let titleLabel = UILabel()
        titleLabel.text = reminder.title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let dateLabel = UILabel()
        dateLabel.text = DateFormatter.localizedString(from: reminder.dateLimit, dateStyle: .full, timeStyle: .none)
        dateLabel.font = UIFont.systemFont(ofSize: 16)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(titleLabel)
        view.addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
        ])
    }
}

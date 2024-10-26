//
//  ViewController.swift
//  reminders-app-mvvm
//
//  Created by Igor Cotrim on 25/10/24.
//

import UIKit

class RemindersListViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemGray5
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 120
        tableView.registerCell(type: ReminderCell.self)
        return tableView
    }()
    
    private lazy var emptyLabel: UILabel = {
        let label = UILabel()
        label.text = "Nenhum lembrete disponível"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        return label
    }()
    
    private func checkEmptyState() {
        emptyLabel.isHidden = !viewModel.reminders.isEmpty
        tableView.isHidden = viewModel.reminders.isEmpty
    }
    
    var viewModel: RemindersListViewModel = RemindersListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkEmptyState()
        setupView()
        
        viewModel.didUpdateReminders = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        viewModel.didSelectReminder = { [weak self] reminder in
            let detailsVC = ReminderDetailsViewController(reminder: reminder)
            self?.navigationController?.pushViewController(detailsVC, animated: true)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func setupNavigation() {
        title = "My reminders"
        navigationController?.navigationBar.prefersLargeTitles = true
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.largeTitleTextAttributes = textAttributes
        
        let moreButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showDrawerOrModal))
        moreButton.tintColor = .white
        navigationItem.rightBarButtonItem = moreButton
    }
    
    @objc private func showDrawerOrModal() {
        let formViewModel = ReminderFormViewModel()
        let modalViewController = ReminderFormModalViewController(viewModel: formViewModel, remindersListViewModel: viewModel)
        modalViewController.modalPresentationStyle = .pageSheet
        present(modalViewController, animated: true, completion: nil)
    }
}

// MARK: - TableView DataSource
extension RemindersListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRemindrs()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let reminderCell = tableView.dequeueCell(withType: ReminderCell.self, for: indexPath) as? ReminderCell else {
            return UITableViewCell()
        }
        
        reminderCell.configure(model: viewModel.reminders[indexPath.row])
        reminderCell.btnIsTouched = {
            self.viewModel.toggleReminder(at: indexPath.row)
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        return reminderCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectReminder(at: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.deleteReminder(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            checkEmptyState()
        }
    }
    
//    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
//        return "Excluir"
//    }
}

// MARK: - ViewCode
extension RemindersListViewController: ViewCode {
    func buildHierarchy() {
        view.addSubview(tableView)
        view.addSubview(emptyLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            emptyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptyLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func applyAdditionalChanges() {
        setupNavigation()
    }
}

//
//  TemplateDetailViewController.swift
//  SetGraph
//
//  Created by Janvi Arora on 24/08/24.
//

import UIKit

class TemplateDetailViewController: SGViewController {

    private var listTemplate: ListTemplate

    private let workoutDesc = SGBodyLabel(textColor: .white, textAlignment: .justified)
    private let addListButton = SGButton(color: .systemGreen, title: Localized.addList)

    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.layer.cornerRadius = 10
        tv.dataSource = self
        tv.delegate = self
        tv.register(WorkoutListCell.self, forCellReuseIdentifier: WorkoutListCell.identifier)
        tv.estimatedRowHeight = 44
        tv.rowHeight = UITableView.automaticDimension
        tv.showsVerticalScrollIndicator = false
        return tv
    }()

    init(listTemplate: ListTemplate) {
        self.listTemplate = listTemplate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = listTemplate.title
    }

    override func configureUIComponents() {
        workoutDesc.text = listTemplate.desc
        workoutDesc.font = UIFont.systemFont(ofSize: 14)
    }

    override func configureNavBar() {
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(ctaCancel))
        navigationItem.leftBarButtonItem = cancelButton
    }

    override func addViews() {
        view.addSubviews(workoutDesc, tableView,  addListButton)
    }

    override func layoutConstraints() {
        NSLayoutConstraint.activate([
            workoutDesc.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            workoutDesc.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            workoutDesc.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),

            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            tableView.topAnchor.constraint(equalTo: workoutDesc.bottomAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: addListButton.topAnchor, constant: -20),

            addListButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            addListButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            addListButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            addListButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    @objc
    private func ctaCancel() {
        dismiss(animated: true)
    }
}

extension TemplateDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listTemplate.workouts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WorkoutListCell.identifier, for: indexPath) as? WorkoutListCell else { fatalError() }
        cell.configure(workout: listTemplate.workouts[indexPath.row])
        return cell
    }
}

extension TemplateDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

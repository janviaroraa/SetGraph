//
//  OrganizeViewController.swift
//  SetGraph
//
//  Created by Janvi Arora on 26/08/24.
//

import UIKit

class OrganizeViewController: SGViewController {

    private var viewModal: OrganizeViewModal?
    private var workouts = [OrganizedWorkout]()

    private let descLabel = SGBodyLabel(textColor: .systemGray, textAlignment: .left)

    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .black
        tv.register(OrganizeTableView.self, forCellReuseIdentifier: OrganizeTableView.identifier)
        tv.dataSource = self
        tv.delegate = self
        tv.rowHeight = 130
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        registerViewModal()
        viewModal?.fetchWorkouts()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
    }

    private func registerViewModal() {
        viewModal = OrganizeViewModal()
        viewModal?.delegate = self
    }

    override func configureNavBar() {
        title = Localized.organizeViewControllerTitle

        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(ctaDone))
        navigationItem.rightBarButtonItem = doneButton
    }

    override func configureUIComponents() {
        descLabel.text = Localized.organizeVCDesc
    }

    override func addViews() {
        view.addSubviews(descLabel, tableView)
    }

    override func layoutConstraints() {
        NSLayoutConstraint.activate([
            descLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            descLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            descLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),

            tableView.topAnchor.constraint(equalTo: descLabel.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: descLabel.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: descLabel.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
    }

    @objc
    private func ctaDone() {
        dismiss(animated: true)
    }
}

extension OrganizeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        workouts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OrganizeTableView.identifier, for: indexPath) as? OrganizeTableView else { fatalError() }
        cell.configure(with: workouts[indexPath.row])
        return cell
    }
}

extension OrganizeViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = WorkoutDetailViewController(workout: workouts[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension OrganizeViewController: OrganizedWorkoutDelegate {
    
    func didFetchWorkouts(_ workouts: [OrganizedWorkout]) {
        self.workouts = workouts
        tableView.reloadData()
    }
}

//
//  SettingsViewController.swift
//  SetGraph
//
//  Created by Janvi Arora on 25/08/24.
//

import UIKit

class SettingsViewController: SGViewController {

    private var viewModal: SettingsViewModal?
    private var sections = [SettingsSection]()

    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .black
        tv.layer.cornerRadius = 10
        tv.dataSource = self
        tv.delegate = self
        tv.register(ExerciseListsCell.self, forCellReuseIdentifier: ExerciseListsCell.identifier)
        tv.rowHeight = 50
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        registerViewModal()
        viewModal?.fetchSettingsSections()
    }

    override func configureNavBar() {
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(ctaDone))
        navigationItem.rightBarButtonItem = doneButton
    }

    private func registerViewModal() {
        viewModal = SettingsViewModal()
        viewModal?.delegate = self
    }

    override func addViews() {
        view.addSubviews(tableView)
    }

    override func layoutConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
        ])
    }

    @objc
    private func ctaDone() {
        dismiss(animated: true)
    }
}

extension SettingsViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExerciseListsCell.identifier, for: indexPath) as? ExerciseListsCell else { fatalError() }

        let imageName = sections[indexPath.section].items?[indexPath.row].image
        let title = sections[indexPath.section].items?[indexPath.row].title
        let shouldHaveAccessoryType = sections[indexPath.section].items?[indexPath.row].accessoryType ?? false

        cell.configure(imageName: imageName, title: title, shouldHaveAccessoryType: shouldHaveAccessoryType)
        cell.setTintColor(tintColor: (indexPath.section == 0) ? .systemYellow : .systemGray)

        if !shouldHaveAccessoryType {
            let menuItem = sections[indexPath.section].items?[indexPath.row].menu
            cell.setMenu(menuItem)
        }

        return cell
    }
}

extension SettingsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}

extension SettingsViewController: SettingsDelegate {

    func didFetchSections(_ sections: [SettingsSection]) {
        self.sections = sections
        tableView.reloadData()
    }
}

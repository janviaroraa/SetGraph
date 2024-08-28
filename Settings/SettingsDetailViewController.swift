//
//  SettingsDetailViewController.swift
//  SetGraph
//
//  Created by Janvi Arora on 27/08/24.
//

import UIKit

class SettingsDetailViewController: SGViewController {

    private var viewModal: SettingsViewModal?
    private var sections = [SettingsSection]()
    private var sectionIndex: Int = 0
    private var rowIndex: Int = 0
    private var shouldShowWorkoutReminderView: Bool?
    private var reminder: Reminder?

    private let workoutReminderView = WorkoutReminderView()

    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .black
        tv.layer.cornerRadius = 10
        tv.dataSource = self
        tv.delegate = self
        tv.register(ExerciseListsCell.self, forCellReuseIdentifier: ExerciseListsCell.identifier)
        tv.estimatedRowHeight = 44
        tv.rowHeight = UITableView.automaticDimension
        return tv
    }()

    init(title: String?, sectionIndex: Int, rowIndex: Int, reminder: Reminder?, shouldShowWorkoutReminderView: Bool? = false) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
        self.sectionIndex = sectionIndex
        self.rowIndex = rowIndex
        self.reminder = reminder
        self.shouldShowWorkoutReminderView = shouldShowWorkoutReminderView
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        registerViewModal()
        viewModal?.fetchSettingsSections()
        workoutReminderView.configure(imageName: reminder?.remindersImage, text: reminder?.remindersDesc)
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
        if shouldShowWorkoutReminderView ?? false { setWorkoutReminderView() }
        view.addSubviews(tableView)
    }

    override func layoutConstraints() {
        if shouldShowWorkoutReminderView ?? false {
            NSLayoutConstraint.activate([
                workoutReminderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
                workoutReminderView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                workoutReminderView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                workoutReminderView.heightAnchor.constraint(equalToConstant: 190),

                tableView.topAnchor.constraint(equalTo: workoutReminderView.bottomAnchor)
            ])
        } else {
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
            ])
        }

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

    private func setWorkoutReminderView() {
        view.addSubview(workoutReminderView)
    }

    @objc
    private func ctaDone() {
        dismiss(animated: true)
    }
}

extension SettingsDetailViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        sections[sectionIndex].items?[rowIndex].navigation?.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[sectionIndex].items?[rowIndex].navigation?[section].navigationItem?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExerciseListsCell.identifier, for: indexPath) as? ExerciseListsCell else { fatalError() }

        let imageName = sections[sectionIndex].items?[rowIndex].navigation?[indexPath.section].navigationItem?[indexPath.row].navigationImage
        let title = sections[sectionIndex].items?[rowIndex].navigation?[indexPath.section].navigationItem?[indexPath.row].navigationTitle
        let desc = sections[sectionIndex].items?[rowIndex].navigation?[indexPath.section].navigationItem?[indexPath.row].navigationDesc
        let shouldHaveAccessoryType = sections[sectionIndex].items?[rowIndex].navigation?[indexPath.section].navigationItem?[indexPath.row].accessoryType ?? false

        cell.configure(imageName: imageName, title: title, desc: desc, shouldHaveAccessoryType: shouldHaveAccessoryType)

        return cell
    }
}

extension SettingsDetailViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        10
    }

    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        10
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerText = sections[sectionIndex].items?[rowIndex].navigation?[section].header
        return headerFooterView(text: headerText)
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerText = sections[sectionIndex].items?[rowIndex].navigation?[section].footer
        return headerFooterView(text: footerText)
    }

    func headerFooterView(text: String?) -> UIView? {
        let label = SGBodyLabel(textColor: .systemGray, textAlignment: .left)
        label.text = text
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false

        let customView = UIView()
        customView.addSubview(label)

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: customView.topAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -10),
            label.bottomAnchor.constraint(equalTo: customView.bottomAnchor, constant: -10)
        ])

        return customView
    }
}

extension SettingsDetailViewController: SettingsDelegate {

    func didFetchSections(_ sections: [SettingsSection]) {
        self.sections = sections
        tableView.reloadData()
    }
}

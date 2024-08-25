//
//  ExerciseDetailViewController.swift
//  SetGraph
//
//  Created by Janvi Arora on 25/08/24.
//


import UIKit

class ExerciseDetailViewController: SGViewController {

    private var exerciseList: ExerciseList

    private let workoutDesc = SGBodyLabel(textColor: .white, textAlignment: .justified)
    private let addExerciseButton = SGButton(color: .secondarySystemBackground, title: Localized.addExercise, imageName: Image.add)

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

    init(exerciseList: ExerciseList) {
        self.exerciseList = exerciseList
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = exerciseList.title
    }

    override func configureUIComponents() {
        workoutDesc.text = exerciseList.desc
        addExerciseButton.configuration?.baseForegroundColor = .systemGreen
    }

    override func configureNavBar() {
        let overflowMenuButton = UIBarButtonItem(image: UIImage(systemName: Image.overflowMenu), style: .done, target: self, action: #selector(ctaOverflowMenu))
        navigationItem.rightBarButtonItem = overflowMenuButton
    }

    override func addViews() {
        view.addSubviews(workoutDesc, tableView,  addExerciseButton)
    }

    override func layoutConstraints() {
        NSLayoutConstraint.activate([
            workoutDesc.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            workoutDesc.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            workoutDesc.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),

            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            tableView.topAnchor.constraint(equalTo: workoutDesc.bottomAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: addExerciseButton.topAnchor, constant: -20),

            addExerciseButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            addExerciseButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            addExerciseButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            addExerciseButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    @objc
    private func ctaOverflowMenu() {
        print("overflowMenu")
    }
}

extension ExerciseDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        exerciseList.workouts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WorkoutListCell.identifier, for: indexPath) as? WorkoutListCell else { fatalError() }
        cell.configure(workout: exerciseList.workouts[indexPath.row])
        return cell
    }
}

extension ExerciseDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

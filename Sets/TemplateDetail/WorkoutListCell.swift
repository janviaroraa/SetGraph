//
//  WorkoutListCell.swift
//  SetGraph
//
//  Created by Janvi Arora on 25/08/24.
//

import UIKit

class WorkoutListCell: UITableViewCell {

    static let identifier = "WorkoutListCell"

    private let workoutNameLabel = SGTitleLabel(textColor: .white, fontSize: 16, textAlignment: .left)
    private let repsLabel = SGTitleLabel(textColor: .white, fontSize: 14, textAlignment: .left)
    private let restLabel = SGTitleLabel(textColor: .white, fontSize: 14, textAlignment: .left)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .secondarySystemBackground
        accessoryType = .disclosureIndicator
        addViews()
        layoutConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureUIElements() {
        workoutNameLabel.font = UIFont.boldSystemFont(ofSize: 16)

        workoutNameLabel.numberOfLines = 0
        repsLabel.numberOfLines = 0
        restLabel.numberOfLines = 0
    }

    private func addViews() {
        contentView.addSubviews(workoutNameLabel, repsLabel, restLabel)
    }

    private func layoutConstraints() {
        NSLayoutConstraint.activate([
            workoutNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            workoutNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            workoutNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),

            repsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            repsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            repsLabel.topAnchor.constraint(equalTo: workoutNameLabel.bottomAnchor, constant: 10),

            restLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            restLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            restLabel.topAnchor.constraint(equalTo: repsLabel.bottomAnchor, constant: 2),
            restLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }

    func configure(workout: Workout) {
        workoutNameLabel.text = workout.exercise
        repsLabel.text = workout.set
        restLabel.text = workout.restTime
    }
}

//
//  OrganizeTableView.swift
//  SetGraph
//
//  Created by Janvi Arora on 26/08/24.
//

import UIKit

class OrganizeTableView: UITableViewCell {

    static let identifier = "OrganizeTableView"

    private let workoutImageView = SGImageView()
    private let titleLabel = SGTitleLabel(textColor: .white, fontSize: 20, textAlignment: .left)
    private let descLabel = SGBodyLabel(textColor: .systemGray, textAlignment: .left)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        addViews()
        layoutConstraints()
        configureUIElements()
        backgroundColor = .black
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureUIElements() {
        workoutImageView.layer.cornerRadius = 20
        workoutImageView.clipsToBounds = true
    }

    private func addViews() {
        contentView.addSubviews(workoutImageView, titleLabel, descLabel)
    }

    private func layoutConstraints() {
        NSLayoutConstraint.activate([
            workoutImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            workoutImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            workoutImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            workoutImageView.widthAnchor.constraint(equalToConstant: 150),

            titleLabel.leadingAnchor.constraint(equalTo: workoutImageView.trailingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: workoutImageView.topAnchor),

            descLabel.leadingAnchor.constraint(equalTo: workoutImageView.trailingAnchor, constant: 20),
            descLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            descLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            descLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }

    func configure(with workout: OrganizedWorkout) {
        titleLabel.text = workout.title
        descLabel.text = workout.desc

        guard let imageURLString = workout.image,
              let url = URL(string: imageURLString) else {
            workoutImageView.image = nil
            return
        }

        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                let image = UIImage(data: data)

                DispatchQueue.main.async {
                    self.workoutImageView.image = image
                }
            } catch {
                print("Error loading image: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    self.workoutImageView.image = nil
                }
            }
        }
    }
}

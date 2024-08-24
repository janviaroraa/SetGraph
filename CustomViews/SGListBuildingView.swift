//
//  SGListBuildingView.swift
//  SetGraph
//
//  Created by Janvi Arora on 24/08/24.
//

import UIKit

class SGListBuildingView: UIView {

    private let titleLabel = SGTitleLabel(textColor: .systemGray, fontSize: 16, textAlignment: .left)
    private let organizeWorkoutView = WelcomeViewItem(imageName: Image.organizeWorkout, title: Localized.organizeWorkout, desc: Localized.organizeWorkoutDesc)

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 10
        addViews()
        layoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addViews() {
        titleLabel.text = Localized.buildLists
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        addSubviews(titleLabel, organizeWorkoutView)
    }

    private func layoutConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            organizeWorkoutView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: -6),
            organizeWorkoutView.leadingAnchor.constraint(equalTo: leadingAnchor),
            organizeWorkoutView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}

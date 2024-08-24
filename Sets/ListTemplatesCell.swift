//
//  ListTemplatesCell.swift
//  SetGraph
//
//  Created by Janvi Arora on 24/08/24.
//

import UIKit

class ListTemplatesCell: UICollectionViewCell {

    private let titleLabel = SGTitleLabel(textColor: .white, fontSize: 18, textAlignment: .left)
    private let descLabel = SGBodyLabel(textColor: .gray, textAlignment: .left)

    static let identifier = "ListTemplatesCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 10
        addViews()
        layoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addViews() {
        contentView.addSubviews(titleLabel, descLabel)
    }

    private func layoutConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            descLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            descLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            descLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }

    func configure() {
        titleLabel.text = "Starting Strength: Workout A"
        descLabel.text = "Squat, Bench, Press, Deadlift"
    }
}

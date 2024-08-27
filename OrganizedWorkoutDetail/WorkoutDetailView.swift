//
//  WorkoutDetailView.swift
//  SetGraph
//
//  Created by Janvi Arora on 26/08/24.
//

import UIKit

class WorkoutDetailView: UIView {

    private let iconImageView = SGImageView()
    private let titleLabel = SGTitleLabel(textColor: .white, fontSize: 24, textAlignment: .left)
    private let addToList = SGButton(color: .systemGreen, title: Localized.addToList, imageName: Image.add)

    convenience init(title: String) {
        self.init(frame: .zero)
        titleLabel.text = title
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground
        configureUIComponents()
        addViews()
        layoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureUIComponents() {
        layer.cornerRadius = 12

        addToList.configuration?.cornerStyle = .capsule
        addToList.configuration?.baseBackgroundColor = .darkGray
        addToList.configuration?.baseForegroundColor = .systemGreen
        addToList.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)

        iconImageView.tintColor = .systemGreen
    }

    private func addViews() {
        addSubviews(iconImageView, titleLabel, addToList)
    }

    private func layoutConstraints() {
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            iconImageView.heightAnchor.constraint(equalToConstant: 40),
            iconImageView.widthAnchor.constraint(equalToConstant: 30),

            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: iconImageView.topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            addToList.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            addToList.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
        ])
    }
}

//
//  WorkoutReminderView.swift
//  SetGraph
//
//  Created by Janvi Arora on 27/08/24.
//

import UIKit

class WorkoutReminderView: UIView {

    private let calendarImageView = SGImageView()
    private let descLabel = SGTitleLabel(textColor: .white, fontSize: 16, textAlignment: .center)

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addViews()
        layoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        addSubviews(calendarImageView, descLabel)
    }

    private func layoutConstraints() {
        NSLayoutConstraint.activate([
            calendarImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            calendarImageView.topAnchor.constraint(equalTo: topAnchor),
            calendarImageView.heightAnchor.constraint(equalToConstant: 80),
            calendarImageView.widthAnchor.constraint(equalToConstant: 90),

            descLabel.topAnchor.constraint(equalTo: calendarImageView.bottomAnchor, constant: 10),
            descLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            descLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
        ])
    }

    func configure(imageName: String?, text: String?) {
        calendarImageView.image = UIImage(systemName: imageName ?? "")
        calendarImageView.tintColor = .systemGreen
        descLabel.text = text
    }
}

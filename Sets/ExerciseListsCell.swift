//
//  ExerciseListsCell.swift
//  SetGraph
//
//  Created by Janvi Arora on 24/08/24.
//

import UIKit

class ExerciseListsCell: UITableViewCell {

    static let identifier = "ExerciseListsCell"

    private let itemImage = SGImageView()
    private let itemTitle = SGTitleLabel(textColor: .white, fontSize: 16, textAlignment: .left)

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

    private func addViews() {
        contentView.addSubviews(itemImage, itemTitle)
    }

    private func layoutConstraints() {
        NSLayoutConstraint.activate([
            itemImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            itemImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            itemImage.widthAnchor.constraint(equalToConstant: 30),
            itemImage.heightAnchor.constraint(equalToConstant: 30),

            itemTitle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            itemTitle.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: 20),
            itemTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        ])
    }

    func configure() {
        itemImage.tintColor = .systemGreen
        itemImage.image = UIImage(systemName: "gear")
        itemTitle.text = "Label"
    }
}

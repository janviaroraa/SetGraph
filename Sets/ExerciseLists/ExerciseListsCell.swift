//
//  ExerciseListsCell.swift
//  SetGraph
//
//  Created by Janvi Arora on 24/08/24.
//

import UIKit

class ExerciseListsCell: UITableViewCell {

    static let identifier = "ExerciseListsCell"

    private var shouldHaveAccessoryType: Bool = false
    private var menuList = [MenuItem]()

    private let itemImage = SGImageView()
    private let itemAccessoryTypeButton = SGButton()
    private let itemTitle = SGTitleLabel(textColor: .white, fontSize: 16, textAlignment: .left)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .secondarySystemBackground
        addViews()
        layoutConstraints()
        itemAccessoryTypeButton.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addViews() {
        contentView.addSubviews(itemImage, itemTitle, itemAccessoryTypeButton)
    }

    private func layoutConstraints() {
        NSLayoutConstraint.activate([
            itemImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            itemImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            itemImage.widthAnchor.constraint(equalToConstant: 30),
            itemImage.heightAnchor.constraint(equalToConstant: 30),

            itemTitle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            itemTitle.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: 20),
            itemTitle.trailingAnchor.constraint(equalTo: itemAccessoryTypeButton.leadingAnchor, constant: -20),

            itemAccessoryTypeButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            itemAccessoryTypeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            itemAccessoryTypeButton.heightAnchor.constraint(equalToConstant: 14),
        ])
    }

    func configure(imageName: String?, title: String?, shouldHaveAccessoryType: Bool) {
        itemImage.tintColor = .systemGreen
        itemImage.image = UIImage(systemName: imageName ?? "")
        itemTitle.text = title
        if shouldHaveAccessoryType {
            accessoryType = .disclosureIndicator
        }
        self.shouldHaveAccessoryType = shouldHaveAccessoryType
    }

    func setTintColor(tintColor: UIColor) {
        itemImage.tintColor = tintColor
    }

    func setMenu(_ menuList: [MenuItem]?) {
        guard !shouldHaveAccessoryType, let menuList else { return }

        itemAccessoryTypeButton.isHidden = false
        itemAccessoryTypeButton.configuration?.baseForegroundColor = .systemGray
        itemAccessoryTypeButton.configuration?.baseBackgroundColor = .secondarySystemBackground
        itemAccessoryTypeButton.configuration?.image = UIImage(systemName: Image.upDown)
        itemAccessoryTypeButton.configuration?.imagePlacement = .trailing
        itemAccessoryTypeButton.configuration?.imagePadding = 6
        itemAccessoryTypeButton.isUserInteractionEnabled = true
        itemAccessoryTypeButton.addTarget(self, action: #selector(handleMenuTap), for: .touchUpInside)

        self.menuList = menuList
    }

    @objc
    private func handleMenuTap(_ sender: UIButton) {
        var actions = [UIAction]()

        for menu in menuList {
            guard let menuItem = menu.menuItem else { return }
            let action = UIAction(title: menuItem) { [weak self] _ in
                self?.itemAccessoryTypeButton.setTitle(menuItem, for: .normal)
            }
            actions.append(action)
        }

        let menu = UIMenu(children: actions)
        sender.showsMenuAsPrimaryAction = true
        sender.menu = menu
    }
}

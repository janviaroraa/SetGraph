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
    private let itemDesc = SGBodyLabel(textColor: .systemGray, textAlignment: .left)

    private lazy var stackView: UIStackView = {
        let stk = UIStackView()
        stk.translatesAutoresizingMaskIntoConstraints = false
        stk.axis = .vertical
        stk.spacing = 4
        return stk
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .secondarySystemBackground
        configureUIElements()
        itemAccessoryTypeButton.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureUIElements() {
        itemTitle.numberOfLines = 0
        itemDesc.numberOfLines = 0
    }

    private func addViews(withImageView: Bool) {
        if withImageView {
            contentView.addSubview(itemImage)
        }
        contentView.addSubviews(stackView, itemAccessoryTypeButton)
        stackView.addArrangedSubview(itemTitle)
        stackView.addArrangedSubview(itemDesc)
    }

    private func layoutConstraints(withImageView: Bool) {
        if withImageView {
            NSLayoutConstraint.activate([
                itemImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                itemImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                itemImage.widthAnchor.constraint(equalToConstant: 24),
                itemImage.heightAnchor.constraint(equalToConstant: 26),

                stackView.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: 20),
                stackView.widthAnchor.constraint(equalToConstant: contentView.frame.width - 100),
            ])
        } else {
            NSLayoutConstraint.activate([
                stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                stackView.widthAnchor.constraint(equalToConstant: contentView.frame.width - 100),
            ])
        }

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }

    func configure(imageName: String?, title: String?, desc: String? = nil, shouldHaveAccessoryType: Bool) {
        itemImage.tintColor = .systemGreen
        itemImage.image = UIImage(systemName: imageName ?? "")
        itemTitle.text = title
        itemDesc.text = desc
        if shouldHaveAccessoryType {
            accessoryType = .disclosureIndicator
        }
        self.shouldHaveAccessoryType = shouldHaveAccessoryType

        if let imageName, !imageName.isEmpty {
            addViews(withImageView: true)
            layoutConstraints(withImageView: true)
        } else {
            addViews(withImageView: false)
            layoutConstraints(withImageView: false)
        }
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

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),

            itemAccessoryTypeButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            itemAccessoryTypeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            itemAccessoryTypeButton.heightAnchor.constraint(equalToConstant: 14),
        ])

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

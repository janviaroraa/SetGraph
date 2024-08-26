//
//  NewListViewController.swift
//  SetGraph
//
//  Created by Janvi Arora on 25/08/24.
//

import UIKit

class NewListViewController: SGViewController {

    private let newListImage = SGImageView()
    private let nameLabel = SGBodyLabel(textColor: .systemGray, textAlignment: .left)
    private let nameTextField = SGTextField(placeholder: Localized.namePlaceholder)
    private let descLabel = SGBodyLabel(textColor: .systemGray, textAlignment: .left)
    private let descTextField = SGTextField(placeholder: Localized.descPlaceholder)
    private let organizeLabel = SGBodyLabel(textColor: .systemGray, textAlignment: .left)

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func configureNavBar() {
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(ctaCancel))
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(ctaDone))

        navigationItem.leftBarButtonItem = cancelButton
        navigationItem.rightBarButtonItem = doneButton
    }

    override func configureUIComponents() {
        newListImage.image = UIImage(systemName: Image.newList)
        newListImage.tintColor = .systemGreen

        nameLabel.text = Localized.name
        descLabel.text = Localized.description
        organizeLabel.text = Localized.organizeBy

        organizeLabel.font = UIFont.systemFont(ofSize: 14)
        organizeLabel.textColor = .systemGreen
    }

    override func addViews() {
        view.addSubviews(newListImage, nameLabel, nameTextField, organizeLabel, descLabel, descTextField)
    }

    override func layoutConstraints() {
        NSLayoutConstraint.activate([
            newListImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newListImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            newListImage.heightAnchor.constraint(equalToConstant: 110),
            newListImage.widthAnchor.constraint(equalToConstant: 80),

            nameLabel.topAnchor.constraint(equalTo: newListImage.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),

            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            nameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 50),

            organizeLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10),
            organizeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            organizeLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),

            descLabel.topAnchor.constraint(equalTo: organizeLabel.bottomAnchor, constant: 20),
            descLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            descLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),

            descTextField.topAnchor.constraint(equalTo: descLabel.bottomAnchor, constant: 10),
            descTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            descTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            descTextField.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    @objc
    private func ctaCancel() {
        dismiss(animated: true)
    }

    @objc
    private func ctaDone() {
        dismiss(animated: true)
    }
}

//
//  WelcomeViewItem.swift
//  SetGraph
//
//  Created by Janvi Arora on 24/08/24.
//

import UIKit

class WelcomeViewItem: UIView {

    private lazy var stackView: UIStackView = {
        let stk = UIStackView()
        stk.translatesAutoresizingMaskIntoConstraints = false
        stk.axis = .vertical
        stk.spacing = 4
        return stk
    }()

    private let imageView = SGImageView()
    private let titleLabel = SGBodyLabel(textColor: .label, textAlignment: .left)
    private let descLabel = SGBodyLabel(textColor: .gray, textAlignment: .justified)

    convenience init(imageName: String, title: String, desc: String) {
        self.init(frame: .zero)
        imageView.image = UIImage(systemName: imageName)?.withTintColor(.systemGreen, renderingMode: .automatic)
        titleLabel.text = title
        descLabel.text = desc
    }

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
        addSubviews(imageView, stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descLabel)
    }

    private func layoutConstraints() {
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            imageView.heightAnchor.constraint(equalToConstant: 60),
            imageView.widthAnchor.constraint(equalToConstant: 60),

            stackView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            stackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

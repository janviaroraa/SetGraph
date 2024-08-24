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
    private let descLabel = SGBodyLabel(textColor: .gray, textAlignment: .left)

    convenience init(imageName: String, title: String, desc: String) {
        self.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: imageName)
        titleLabel.text = title
        descLabel.text = desc
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        layoutConstraints()
        imageView.tintColor = .systemGreen
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
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: frame.height/2 + 30),
            imageView.heightAnchor.constraint(equalToConstant: 30),
            imageView.widthAnchor.constraint(equalToConstant: 30),

            stackView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }

}

//
//  SGTextField.swift
//  SetGraph
//
//  Created by Janvi Arora on 25/08/24.
//

import UIKit

class SGTextField: UITextField {

    private var padding: UIEdgeInsets

    convenience init(placeholder: String) {
        self.init(frame: .zero)
        self.placeholder = placeholder
    }

    override init(frame: CGRect) {
        self.padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor

        textColor = .label
        tintColor = .label
        textAlignment = .left

        backgroundColor = .tertiarySystemBackground
        font = UIFont.preferredFont(forTextStyle: .body)

        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12

        autocorrectionType = .no
        keyboardType = .default
        returnKeyType = .go
        clearButtonMode = .whileEditing
    }

    // Provide padding for text
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    // Provide padding for placeholder
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    // Provide padding while editing
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}

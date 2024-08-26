//
//  SGBodyLabel.swift
//  SetGraph
//
//  Created by Janvi Arora on 24/08/24.
//

import UIKit

class SGBodyLabel: UILabel {

    convenience init(textColor: UIColor, textAlignment: NSTextAlignment) {
        self.init(frame: .zero)
        self.textColor = textColor
        self.textAlignment = textAlignment
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont.systemFont(ofSize: 14)
        numberOfLines = 0
        lineBreakMode = .byTruncatingTail
        
//        minimumScaleFactor = 0.6
//        adjustsFontSizeToFitWidth = true
    }
}


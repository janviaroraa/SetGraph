//
//  SGImageView.swift
//  SetGraph
//
//  Created by Janvi Arora on 24/08/24.
//

import UIKit

class SGImageView: UIImageView {

    convenience init() {
        self.init(frame: .zero)
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}

//
//  SGButton.swift
//  SetGraph
//
//  Created by Janvi Arora on 24/08/24.
//

import UIKit

class SGButton: UIButton {

    convenience init(color: UIColor, title: String, imageName: String) {
        self.init(frame: .zero)
        set(color: color, title: title, imageName: imageName)
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
        configuration = .filled()
        configuration?.cornerStyle = .medium
    }

    private func set(color: UIColor, title: String, imageName: String) {
        configuration?.baseBackgroundColor = color
        configuration?.baseForegroundColor = .black
        configuration?.title = title

        configuration?.imagePlacement = .leading
        configuration?.image = UIImage(systemName: imageName)
        configuration?.imagePadding = 6
    }
}

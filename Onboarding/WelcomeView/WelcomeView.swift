//
//  WelcomeView.swift
//  SetGraph
//
//  Created by Janvi Arora on 24/08/24.
//

import UIKit

class WelcomeView: UIView {

    private let item1 = WelcomeViewItem(imageName: Image.progress, title: Localized.targetedProgress, desc: Localized.targetedProgressDesc)
    private let item2 = WelcomeViewItem(imageName: Image.logging, title: Localized.quickLogging, desc: Localized.quickLoggingDesc)
    private let item3 = WelcomeViewItem(imageName: Image.organize, title: Localized.easyOrganization, desc: Localized.easyOrganizationDesc)

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
        addSubviews(item1, item2, item3)
    }

    private func layoutConstraints() {
        NSLayoutConstraint.activate([
            item1.topAnchor.constraint(equalTo: topAnchor),
            item1.leadingAnchor.constraint(equalTo: leadingAnchor),
            item1.trailingAnchor.constraint(equalTo: trailingAnchor),

            item2.topAnchor.constraint(equalTo: item1.bottomAnchor),
            item2.leadingAnchor.constraint(equalTo: leadingAnchor),
            item2.trailingAnchor.constraint(equalTo: trailingAnchor),

            item3.topAnchor.constraint(equalTo: item2.bottomAnchor),
            item3.leadingAnchor.constraint(equalTo: leadingAnchor),
            item3.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}

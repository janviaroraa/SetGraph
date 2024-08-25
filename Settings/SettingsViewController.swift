//
//  SettingsViewController.swift
//  SetGraph
//
//  Created by Janvi Arora on 25/08/24.
//

import UIKit

class SettingsViewController: SGViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
    }

    override func configureNavBar() {
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(ctaDone))
        navigationItem.rightBarButtonItem = doneButton
    }

    override func addViews() {

    }

    override func layoutConstraints() {

    }

    @objc
    private func ctaDone() {
        dismiss(animated: true)
    }
}

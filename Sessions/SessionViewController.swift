//
//  SessionViewController.swift
//  SetGraph
//
//  Created by Janvi Arora on 24/08/24.
//

import UIKit

class SessionViewController: SGViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func configureNavBar() {
        let leftBarButton = UIBarButtonItem(title: "Duration", style: .plain, target: self, action: #selector(ctaDuration))
        let rightBarButton = UIBarButtonItem(title: "Style", style: .plain, target: self, action: #selector(ctaStyle))

        navigationItem.leftBarButtonItem = leftBarButton
        navigationItem.rightBarButtonItem = rightBarButton
    }

    @objc
    private func ctaDuration() {
        print("Duration")
    }

    @objc
    private func ctaStyle() {
        print("Style")
    }
}


//
//  TodayViewController.swift
//  SetGraph
//
//  Created by Janvi Arora on 24/08/24.
//

import UIKit

class TodayViewController: SGViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func configureNavBar() {
        let calendarBarButton = UIBarButtonItem(image: UIImage(systemName: Image.calendar), style: .done, target: self, action: #selector(ctaCalendar))
        let shareBarButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(ctaShare))

        navigationItem.rightBarButtonItems = [shareBarButton, calendarBarButton]
    }

    @objc
    private func ctaCalendar() {
        print("Calendar")
    }

    @objc
    private func ctaShare() {
        print("Share")
    }
}


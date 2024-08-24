//
//  SGTabBarController.swift
//  SetGraph
//
//  Created by Janvi Arora on 24/08/24.
//

import UIKit

class SGTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .systemGreen
        UINavigationBar.appearance().tintColor = .systemGreen
        configure()
    }

    private func configure() {
        let vc1 = SetsViewController()
        let vc2 = SessionViewController()
        let vc3 = TodayViewController()

        vc2.title = "Sessions"
        vc3.title = "Today"

        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)

        nav1.tabBarItem = UITabBarItem(title: "Sets", image: TabItems.sets, tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Sessions", image: TabItems.sessions, tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Today", image: TabItems.today, tag: 3)

        setViewControllers([nav1, nav2, nav3], animated: true)
    }
}

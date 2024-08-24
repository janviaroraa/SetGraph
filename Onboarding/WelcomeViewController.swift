//
//  WelcomeViewController.swift
//  SetGraph
//
//  Created by Janvi Arora on 24/08/24.
//

import UIKit

class WelcomeViewController: SGViewController {

    private let welocmeLabel = SGTitleLabel(textColor: .white, fontSize: 40, textAlignment: .center)
    private let appLabel = SGTitleLabel(textColor: .systemGreen, fontSize: 40, textAlignment: .center)
    private let welcomeView = WelcomeView()
    private let termsAndPrivacyLabel = SGTitleLabel(textColor: .systemGray4, fontSize: 14, textAlignment: .justified)
    private let loginApplebutton = SGButton(color: .white, title: Localized.appleSignUp, imageName: Image.appleLogo)
    private let loginEmailbutton = SGButton(color: .systemGreen, title: Localized.emailSignUp, imageName: Image.emailLogo)

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func configureUIComponents() {
        termsAndPrivacyLabel.text = Localized.termsAndPrivacy
        welocmeLabel.text = Localized.welcomeLabel
        appLabel.text = Localized.appLabel

        welocmeLabel.font = UIFont.boldSystemFont(ofSize: 40)
        appLabel.font = UIFont.boldSystemFont(ofSize: 40)
    }

    override func addViews() {
        view.addSubviews(welocmeLabel, appLabel, welcomeView, loginApplebutton, loginEmailbutton, termsAndPrivacyLabel)
    }

    override func layoutConstraints() {
        NSLayoutConstraint.activate([
            welocmeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            welocmeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            welocmeLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),

            appLabel.topAnchor.constraint(equalTo: welocmeLabel.bottomAnchor),
            appLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            appLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),

            welcomeView.topAnchor.constraint(equalTo: appLabel.bottomAnchor, constant: 20),
            welcomeView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            welcomeView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),

            termsAndPrivacyLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            termsAndPrivacyLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            termsAndPrivacyLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),

            loginEmailbutton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            loginEmailbutton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            loginEmailbutton.bottomAnchor.constraint(equalTo: termsAndPrivacyLabel.topAnchor, constant: -10),
            loginEmailbutton.heightAnchor.constraint(equalToConstant: 50),

            loginApplebutton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            loginApplebutton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            loginApplebutton.bottomAnchor.constraint(equalTo: loginEmailbutton.topAnchor, constant: -10),
            loginApplebutton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    override func addTargets() {
        loginApplebutton.addTarget(self, action: #selector(loginWithApple), for: .touchUpInside)
        loginEmailbutton.addTarget(self, action: #selector(loginWithEmail), for: .touchUpInside)
    }

    @objc
    private func loginWithApple() {
        let tabBarController = SGTabBarController()

        if let windowScene = view.window?.windowScene {
            let window = windowScene.windows.first { $0.isKeyWindow }

            let transition = CATransition()
            transition.duration = 0.5
            transition.type = .push
            transition.subtype = .fromRight
            transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)

            window?.layer.add(transition, forKey: kCATransition)
            window?.rootViewController = tabBarController
        }
    }

    @objc
    private func loginWithEmail() {

    }
}

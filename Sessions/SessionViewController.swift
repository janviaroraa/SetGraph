//
//  SessionViewController.swift
//  SetGraph
//
//  Created by Janvi Arora on 24/08/24.
//

import UIKit

class SessionViewController: SGViewController {

    private var isRecordingNewSession = false

    private var leftBarButton: UIBarButtonItem?
    private var rightBarButton: UIBarButtonItem?

    private let ongoingSessionView = OngoingSessionView()
    private let sessionsButton = SGButton(color: .systemGreen, title: Localized.all)
    private let runningButton = SGButton(color: .black, title: Localized.running, imageName: Image.run)
    private let upDownImage = SGImageView()
    private let newSessionsButton = SGButton(color: .black, title: Localized.newSession)

    private lazy var spacer: UIView = {
        let vw = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.backgroundColor = .systemGray3
        return vw
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setNeedsUpdateContentUnavailableConfiguration()
        ongoingSessionView.delegate = self
    }

    override func updateContentUnavailableConfiguration(using state: UIContentUnavailableConfigurationState) {
        var config = UIContentUnavailableConfiguration.empty()
        config.image = TabItems.sessions
        config.text = Localized.emptySessionTitle
        config.secondaryText = Localized.emptySessionDesc
        contentUnavailableConfiguration = config
    }

    override func configureNavBar() {
        leftBarButton = UIBarButtonItem(title: Localized.duration, style: .plain, target: self, action: #selector(ctaDuration))
        rightBarButton = UIBarButtonItem(title: Localized.style, style: .plain, target: self, action: #selector(ctaStyle))

        navigationItem.leftBarButtonItem = leftBarButton
        navigationItem.rightBarButtonItem = rightBarButton
    }

    override func configureUIComponents() {
        sessionsButton.configuration?.cornerStyle = .capsule
        sessionsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)

        newSessionsButton.configuration?.baseForegroundColor = .systemGreen
        newSessionsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)

        runningButton.configuration?.baseForegroundColor = .white
        runningButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)

        upDownImage.image = UIImage(systemName: Image.upDown)
        upDownImage.tintColor = .white
    }

    override func addViews() {
        view.addSubviews(ongoingSessionView, sessionsButton, spacer, runningButton, upDownImage, newSessionsButton)
    }

    override func layoutConstraints() {
        NSLayoutConstraint.activate([
            sessionsButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            sessionsButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),

            ongoingSessionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            ongoingSessionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ongoingSessionView.bottomAnchor.constraint(equalTo: spacer.topAnchor, constant: -15),
            ongoingSessionView.heightAnchor.constraint(equalToConstant: 50),

            spacer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            spacer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            spacer.bottomAnchor.constraint(equalTo: newSessionsButton.topAnchor, constant: -15),
            spacer.heightAnchor.constraint(equalToConstant: 1),

            runningButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            runningButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15),

            upDownImage.leadingAnchor.constraint(equalTo: runningButton.trailingAnchor, constant: -4),
            upDownImage.centerYAnchor.constraint(equalTo: runningButton.centerYAnchor),
            upDownImage.heightAnchor.constraint(equalToConstant: 20),
            upDownImage.widthAnchor.constraint(equalToConstant: 16),

            newSessionsButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            newSessionsButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
        ])
    }

    override func addTargets() {
        runningButton.addTarget(self, action: #selector(ctaRunning), for: .touchUpInside)
        newSessionsButton.addTarget(self, action: #selector(ctaNewSession), for: .touchUpInside)
    }

    @objc
    private func ctaDuration(_ sender: UIBarButtonItem) {
        var children = [UIAction]()

        for item in SessionLeftBarButtonItemOptions.allCases {
            let action = UIAction(title: item.buttonTitle) { [weak self] _ in
                self?.leftBarButton?.title = item.buttonTitle
                self?.rightBarButton?.title = (item == .duration) ? Localized.style : ""
            }
            children.append(action)
        }

        sender.menu = UIMenu(title: Localized.viewing, children: children)
    }

    @objc
    private func ctaStyle(_ sender: UIBarButtonItem) {
        let hoursMins = UIAction(title: Localized.hoursMins) {_ in
            print("HOUR:MIN")
        }

        let hoursMinsSecs = UIAction(title: Localized.hoursMinsSecs) {_ in
            print("HOUR:MIN:SEC")
        }

        sender.menu = UIMenu(children: [hoursMins, hoursMinsSecs])
    }

    @objc
    private func ctaRunning() {

    }

    @objc
    private func ctaNewSession(_ sender: UIButton) {
        func createMenu() -> UIMenu {
            let sessionStatusTitle = self.isRecordingNewSession ? Localized.finishSession : Localized.startSession

            let startNow = UIAction(title: sessionStatusTitle, image: UIImage(systemName: Image.startSession)) { [weak self] _ in
                guard let self else { return }

                self.isRecordingNewSession.toggle()
                self.newSessionsButton.setTitle(self.isRecordingNewSession ? Localized.finishSession : Localized.newSession, for: .normal)

                self.runningButton.configuration?.image = self.runningButton.configuration?.image?.withRenderingMode(.alwaysTemplate)
                self.runningButton.configuration?.baseForegroundColor = self.isRecordingNewSession ? .systemYellow : .white

                self.ongoingSessionView.isHidden = !self.isRecordingNewSession
                self.ongoingSessionView.isRecording = !self.isRecordingNewSession

                if self.isRecordingNewSession == false {
                    // Notify SessionView to finish the session and save the data.
                }

                sender.menu = createMenu()
            }

            let manualEntry = UIAction(title: Localized.manualEntry, image: UIImage(systemName: Image.add)) { _ in
                print("manualEntry")
            }

            return UIMenu(children: [manualEntry, startNow])
        }
        
        sender.showsMenuAsPrimaryAction = true
        sender.menu = createMenu()
    }

}

extension SessionViewController: OngoingSessionDelegate {
    
    func didDiscardSession() {
        isRecordingNewSession.toggle()
        newSessionsButton.setTitle(isRecordingNewSession ? Localized.finishSession : Localized.newSession, for: .normal)

        runningButton.configuration?.image = runningButton.configuration?.image?.withRenderingMode(.alwaysTemplate)
        runningButton.configuration?.baseForegroundColor = isRecordingNewSession ? .systemYellow : .white
    }
}

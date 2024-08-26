//
//  OngoingSessionView.swift
//  SetGraph
//
//  Created by Janvi Arora on 25/08/24.
//

import UIKit

protocol OngoingSessionDelegate: AnyObject {
    func didDiscardSession()
}

class OngoingSessionView: UIView {

    private var timer: Timer?
    private var counter = 0.0

    var isRecording: Bool = false {
        didSet {
            setupTimer()
            updateSessionButtonImage()
        }
    }

    weak var delegate: OngoingSessionDelegate?

    private let timeLabel = SGTitleLabel(textColor: .white, fontSize: 24, textAlignment: .left)
    private let sessionButton = SGButton(color: .darkGray, title: "")
    private let actionButton = SGButton(color: .darkGray, title: "", imageName: Image.cross)

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        isHidden = true
        backgroundColor = .darkGray
        configureUIElements()
        addViews()
        layoutConstraints()
        addTargets()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureUIElements() {
        layer.cornerRadius = 25

        timeLabel.text = Localized.initialTime
        timeLabel.font = UIFont.boldSystemFont(ofSize: 24)

        sessionButton.configuration?.baseForegroundColor = .white
        updateSessionButtonImage()

        actionButton.configuration?.baseForegroundColor = .white
    }

    private func addViews() {
        addSubviews(timeLabel, sessionButton, actionButton)
    }

    private func layoutConstraints() {
        NSLayoutConstraint.activate([
            timeLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            timeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),

            actionButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            actionButton.heightAnchor.constraint(equalToConstant: 30),
            actionButton.widthAnchor.constraint(equalToConstant: 24),
            actionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            sessionButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            sessionButton.heightAnchor.constraint(equalToConstant: 30),
            sessionButton.widthAnchor.constraint(equalToConstant: 30),
            sessionButton.trailingAnchor.constraint(equalTo: actionButton.trailingAnchor, constant: -40),
        ])
    }

    private func addTargets() {
        sessionButton.addTarget(self, action: #selector(ctaSession), for: .touchUpInside)
        actionButton.addTarget(self, action: #selector(ctaAction), for: .touchUpInside)
    }

    private func setupTimer() {
        timer?.invalidate() // Always invalidate the previous timer to stop it

        if isRecording {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
    }

    @objc
    private func updateTimer() {
        counter += 0.1

        let hours = Int(counter) / 3600
        let minutes = (Int(counter) % 3600) / 60
        let seconds = Int(counter) % 60

        timeLabel.text = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }

    @objc
    private func ctaSession() {
        isRecording.toggle()
    }

    private func updateSessionButtonImage() {
        sessionButton.configuration?.image = isRecording ? UIImage(systemName: Image.pause) : UIImage(systemName: Image.resume)
    }

    @objc
    private func ctaAction(_ sender: UIButton) {
        let discardAction = UIAction(title: Localized.discard, image: UIImage(systemName: Image.discard)) { [weak self] _ in
            guard let self else { return }
            self.isRecording = false
            self.isHidden = true
            self.counter = 0.0
            self.timeLabel.text = String(format: "%02d:%02d:%02d", 0, 0, 0)
            self.delegate?.didDiscardSession()
        }

        let menu = UIMenu(children: [discardAction])
        sender.menu = menu
    }
}

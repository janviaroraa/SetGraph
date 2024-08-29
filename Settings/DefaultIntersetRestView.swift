//
//  DefaultIntersetRestView.swift
//  SetGraph
//
//  Created by Janvi Arora on 28/08/24.
//

import UIKit

class DefaultIntersetRestView: UITableViewCell {

    static let identifier = "DefaultIntersetRestView"

    private let intersetRestImage = SGImageView()
    private let titleLabel = SGTitleLabel(textColor: .white, fontSize: 22, textAlignment: .left)
    private let descLabel = SGBodyLabel(textColor: .white, textAlignment: .left)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        layoutConstraints()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureUIElements() {
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        descLabel.font = UIFont.systemFont(ofSize: 16)
    }

    private func addViews() {
        addSubviews(intersetRestImage, titleLabel, descLabel)
    }

    private func layoutConstraints() {
        NSLayoutConstraint.activate([
            intersetRestImage.topAnchor.constraint(equalTo: topAnchor),
            intersetRestImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            intersetRestImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            intersetRestImage.heightAnchor.constraint(equalToConstant: 250),

            titleLabel.topAnchor.constraint(equalTo: intersetRestImage.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            descLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            descLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            descLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }

    // imageName: String?, title: String?, desc: String?
    func configure() {
        titleLabel.text = "Understanding Interset Rest"
        descLabel.text = "How it affects your muscles & performance."

        guard let url = URL(string: "https://plus.unsplash.com/premium_photo-1679635697608-cbd7392169db?q=80&w=2971&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D") else {
            intersetRestImage.image = nil
            return
        }

        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                let image = UIImage(data: data)

                DispatchQueue.main.async {
                    self.intersetRestImage.image = image
                }
            } catch {
                print("Error loading image: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    self.intersetRestImage.image = nil
                }
            }
        }
    }
}

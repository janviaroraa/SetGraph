//
//  WorkoutDetailViewController.swift
//  SetGraph
//
//  Created by Janvi Arora on 26/08/24.
//

import UIKit

class WorkoutDetailViewController: SGViewController {

    private let workout: OrganizedWorkout

    private lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.showsVerticalScrollIndicator = true
        sv.showsHorizontalScrollIndicator = false
        sv.isDirectionalLockEnabled = true
        return sv
    }()

    private lazy var contentView: UIView = {
        let vw = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
    }()

    private let workoutImageView = SGImageView()
    private let titleLabel = SGTitleLabel(textColor: .white, fontSize: 30, textAlignment: .left)
    private let descLabel = SGBodyLabel(textColor: .white, textAlignment: .left)
    private let exampleLabel = SGTitleLabel(textColor: .white, fontSize: 24, textAlignment: .left)
    private let workoutDetailView = WorkoutDetailView(title: "hii")

    init(workout: OrganizedWorkout) {
        self.workout = workout
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    override func configureUIComponents() {
        descLabel.font = UIFont.systemFont(ofSize: 16)

        exampleLabel.text = Localized.examples
        exampleLabel.font = UIFont.boldSystemFont(ofSize: 24)
    }

    override func addViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(workoutImageView, titleLabel, descLabel, exampleLabel, workoutDetailView)
    }

    override func layoutConstraints() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            workoutImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            workoutImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            workoutImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            workoutImageView.heightAnchor.constraint(equalToConstant: 270),

            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            titleLabel.bottomAnchor.constraint(equalTo: workoutImageView.bottomAnchor, constant: -20),

            descLabel.topAnchor.constraint(equalTo: workoutImageView.bottomAnchor, constant: 20),
            descLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            exampleLabel.topAnchor.constraint(equalTo: descLabel.bottomAnchor, constant: 30),
            exampleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            exampleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            workoutDetailView.topAnchor.constraint(equalTo: exampleLabel.bottomAnchor, constant: 20),
            workoutDetailView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            workoutDetailView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        ])
    }

    private func configure() {
        titleLabel.text = workout.title
        descLabel.text = workout.desc

        guard let imageURLString = workout.image,
              let url = URL(string: imageURLString) else {
            workoutImageView.image = nil
            return
        }

        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                let image = UIImage(data: data)

                DispatchQueue.main.async {
                    self.workoutImageView.image = image
                }
            } catch {
                print("Error loading image: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    self.workoutImageView.image = nil
                }
            }
        }
    }
}

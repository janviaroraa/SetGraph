//
//  SetsViewController.swift
//  SetGraph
//
//  Created by Janvi Arora on 24/08/24.
//

import UIKit

class SetsViewController: SGViewController {

    private let exerciseListsLabel = SGTitleLabel(textColor: .label, fontSize: 24, textAlignment: .left)
    private let templatesLabel = SGTitleLabel(textColor: .label, fontSize: 24, textAlignment: .left)
    private let buildListsView = SGListBuildingView()

    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.layer.cornerRadius = 10
        tv.dataSource = self
        tv.delegate = self
        tv.register(ExerciseListsCell.self, forCellReuseIdentifier: ExerciseListsCell.identifier)
        tv.rowHeight = 50
        return tv
    }()

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()

        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        cv.register(ListTemplatesCell.self, forCellWithReuseIdentifier: ListTemplatesCell.identifier)
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUIComponents()
        addViews()
        layoutConstraints()
    }

    override func configureNavBar() {
        let settingsButton = UIBarButtonItem(image: UIImage(systemName: Image.settings), style: .plain, target: self, action: #selector(settingsButtonTap))
        settingsButton.tintColor = .systemGray
        navigationItem.leftBarButtonItem = settingsButton
    }

    override func configureUIComponents() {
        exerciseListsLabel.text = Localized.exerciseLists
        templatesLabel.text = Localized.listTemplates

        exerciseListsLabel.font = UIFont.boldSystemFont(ofSize: 24)
        templatesLabel.font = UIFont.boldSystemFont(ofSize: 24)

        buildListsView.backgroundColor = .secondarySystemBackground
    }

    override func addViews() {
        view.addSubviews(exerciseListsLabel, tableView, templatesLabel, collectionView, buildListsView)
    }

    override func layoutConstraints() {
        NSLayoutConstraint.activate([
            exerciseListsLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            exerciseListsLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            exerciseListsLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),

            tableView.topAnchor.constraint(equalTo: exerciseListsLabel.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            tableView.heightAnchor.constraint(equalToConstant: 150),

            templatesLabel.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 24),
            templatesLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            templatesLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),

            collectionView.topAnchor.constraint(equalTo: templatesLabel.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            collectionView.heightAnchor.constraint(equalToConstant: 260),

            buildListsView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10),
            buildListsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            buildListsView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
    }

    @objc
    private func settingsButtonTap() {
        print("Settings")
    }
}

extension SetsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExerciseListsCell.identifier, for: indexPath) as? ExerciseListsCell else { fatalError() }
        cell.configure()
        return cell
    }
}

extension SetsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension SetsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListTemplatesCell.identifier, for: indexPath) as? ListTemplatesCell else { fatalError() }
        cell.configure()
        return cell
    }
}

extension SetsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension SetsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = view.frame.size.width
        let cellWidth = (screenWidth/2) - 25
        return CGSize(width: cellWidth, height: 120)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
}

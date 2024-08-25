//
//  SetsViewModal.swift
//  SetGraph
//
//  Created by Janvi Arora on 24/08/24.
//

import Foundation

protocol SetsDelegate: AnyObject {
    func didFetchExerciseList(_ data: [ExerciseList])
    func didFetchListTemplate(_ data: [ListTemplate])
}

class SetsViewModal {

    weak var delegate: SetsDelegate?

    func fetchExerciseListsData() {
        NetworkManager.shared.fetchData(from: "ExerciseLists", resultType: ExerciseListModal.self) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let exerciseLists):
                guard let results = exerciseLists.results else { return }
                self.delegate?.didFetchExerciseList(results)
            case .failure(let error):
                print("Failed to fetch ExerciseLists: \(error)")
            }
        }
    }

    func fetchListTemplatesData() {
        NetworkManager.shared.fetchData(from: "ListTemplates", resultType: ListTemplateModal.self) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let listTemplates):
                guard let results = listTemplates.results else { return }
                self.delegate?.didFetchListTemplate(results)
            case .failure(let error):
                print("Failed to fetch ListTemplates: \(error)")
            }
        }
    }
}

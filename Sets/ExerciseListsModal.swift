//
//  ExerciseListsModal.swift
//  SetGraph
//
//  Created by Janvi Arora on 24/08/24.
//

import Foundation

struct ExerciseListsModal: Codable {
    let results: [ExerciseList]?
}

struct ExerciseList: Codable {
    let image: String?
    let title: String?
}

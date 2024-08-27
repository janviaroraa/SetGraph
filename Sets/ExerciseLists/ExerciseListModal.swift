//
//  ExerciseListModal.swift
//  SetGraph
//
//  Created by Janvi Arora on 24/08/24.
//

import Foundation

struct ExerciseListModal: Codable {
    let results: [ExerciseList]?
}

struct ExerciseList: Codable {
    let image: String?
    let title: String?
    let desc: String?
    let rightBarButton: String?
    let accessoryType: Bool?
    let workouts: [Workout]
}

//
//  ListTemplateModal.swift
//  SetGraph
//
//  Created by Janvi Arora on 24/08/24.
//

import Foundation

struct ListTemplateModal: Codable {
    let results: [ListTemplate]?
}

struct ListTemplate: Codable {
    let title: String?
    let desc: String?
    let exercises: String?
    let workouts: [Workout]
}

struct Workout: Codable {
    let exercise: String?
    let set: String?
    let restTime: String?
}

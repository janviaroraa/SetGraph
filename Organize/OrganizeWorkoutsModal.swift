//
//  OrganizeWorkoutsModal.swift
//  SetGraph
//
//  Created by Janvi Arora on 26/08/24.
//

import Foundation

struct OrganizeWorkoutsModal: Codable {
    let results: [OrganizedWorkout]
}

struct OrganizedWorkout: Codable {
    let image: String?
    let title: String?
    let desc: String?
}

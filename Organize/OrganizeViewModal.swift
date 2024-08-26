//
//  OrganizeViewModal.swift
//  SetGraph
//
//  Created by Janvi Arora on 26/08/24.
//

import Foundation

protocol OrganizedWorkoutDelegate: AnyObject {
    func didFetchWorkouts(_ workouts: [OrganizedWorkout])
}

class OrganizeViewModal {

    weak var delegate: OrganizedWorkoutDelegate?

    func fetchWorkouts() {
        NetworkManager.shared.fetchData(from: "OrganizedWorkouts", resultType: OrganizeWorkoutsModal.self) { [weak self] result in
            switch result {
            case .success(let workouts):
                self?.delegate?.didFetchWorkouts(workouts.results)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

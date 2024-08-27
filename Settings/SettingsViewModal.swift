//
//  SettingsViewModal.swift
//  SetGraph
//
//  Created by Janvi Arora on 26/08/24.
//

import Foundation

protocol SettingsDelegate: AnyObject {
    func didFetchSections(_ sections: [SettingsSection])
}

class SettingsViewModal {

    weak var delegate: SettingsDelegate?

    func fetchSettingsSections() {
        NetworkManager.shared.fetchData(from: "Settings", resultType: SettingsModal.self) { [weak self] result in
            switch result {
            case .success(let results):
                guard let sections = results.sections else { return }
                self?.delegate?.didFetchSections(sections)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

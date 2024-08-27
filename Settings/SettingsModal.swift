//
//  SettingsModal.swift
//  SetGraph
//
//  Created by Janvi Arora on 26/08/24.
//

import Foundation

struct SettingsModal: Codable {
    let sections: [SettingsSection]?
}

struct SettingsSection: Codable {
    let items: [SettingsSectionItems]?
}

struct SettingsSectionItems: Codable {
    let image: String?
    let title: String?
    let accessoryType: Bool?
    let menu: [MenuItem]?
}

struct MenuItem: Codable {
    let menuItem: String?
}

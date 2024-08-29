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
    let shouldShowReminderView: Bool?
    let shouldShowIntersetRestView: Bool?
    let reminders: Reminder?
    let menu: [MenuItem]?
    let navigation: [SettingsNavigation]?
}

struct Reminder: Codable {
    let remindersImage: String?
    let remindersDesc: String?
}

struct MenuItem: Codable {
    let menuItem: String?
}

struct SettingsNavigation: Codable {
    let navigationItem: [NavigationItem]?
    let header: String?
    let footer: String?
}

struct NavigationItem: Codable {
    let navigationImage: String?
    let navigationTitle: String?
    let navigationDesc: String?
    let accessoryType: Bool?
    let tintColor: String?
}

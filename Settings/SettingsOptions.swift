//
//  SettingsOptions.swift
//  SetGraph
//
//  Created by Janvi Arora on 25/08/24.
//

import UIKit

enum Membership: CaseIterable {
    case pro

    var displayTitle: String {
        switch self {
        case .pro: return "Pro Membership"
        }
    }

    var iconImage: UIImage? {
        switch self {
        case .pro: return UIImage(systemName: SettingsImages.pro)
        }
    }

    var tintColor: UIColor {
        switch self {
        case .pro: return .systemYellow
        }
    }
}

enum AppSettings: CaseIterable {
    case account
    case smartPlates
    case unit
    case integrations
    case shortcuts
    case theme

    var displayTitle: String {
        switch self {
        case .account: return "Account"
        case .smartPlates: return "Smart Plates"
        case .unit: return "Unit"
        case .integrations: return "Integrations"
        case .shortcuts: return "Shortcuts"
        case .theme: return "Theme"
        }
    }

    var iconImage: UIImage? {
        switch self {
        case .account: return UIImage(systemName: SettingsImages.account)
        case .smartPlates: return UIImage(systemName: SettingsImages.smartPlates)
        case .unit: return UIImage(systemName: SettingsImages.unit)
        case .integrations: return UIImage(systemName: SettingsImages.integrations)
        case .shortcuts: return UIImage(systemName: SettingsImages.shortcuts)
        case .theme: return UIImage(systemName: SettingsImages.theme)
        }
    }
}

enum WorkoutSettings: CaseIterable {
    case workoutReminders
    case defaultIntersetRest

    var displayTitle: String {
        switch self {
        case .workoutReminders: return "Workout Reminders"
        case .defaultIntersetRest: return "Default IntersetRest"
        }
    }

    var iconImage: UIImage? {
        switch self {
        case .workoutReminders: return UIImage(systemName: SettingsImages.workoutReminders)
        case .defaultIntersetRest: return UIImage(systemName: SettingsImages.defaultIntersetRest)
        }
    }
}

enum Help: CaseIterable {
    case helpAndFeedback
    case versionHistory

    var displayTitle: String {
        switch self {
        case .helpAndFeedback: return "Help & Feedback"
        case .versionHistory: return "Version History"
        }
    }

    var iconImage: UIImage? {
        switch self {
        case .helpAndFeedback: return UIImage(systemName: SettingsImages.helpAndFeedback)
        case .versionHistory: return UIImage(systemName: SettingsImages.versionHistory)
        }
    }
}

//
//  SessionLeftBarButtonItemOptions.swift
//  SetGraph
//
//  Created by Janvi Arora on 25/08/24.
//

import Foundation

enum SessionLeftBarButtonItemOptions: CaseIterable {
    case duration
    case calories
    case distance
    case swimmingStrokes
    case flightsClimbed
    case locationSetting
    case notes
    case customDetail

    var buttonTitle: String {
        switch self {
        case .duration: return "Duration"
        case .calories: return "Calories"
        case .distance: return "Distance"
        case .swimmingStrokes: return "Swimming Strokes"
        case .flightsClimbed: return "Flights Climbed"
        case .locationSetting: return "Location Setting"
        case .notes: return "Notes"
        case .customDetail: return "Custom Detail"
        }
    }
}

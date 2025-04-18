//
//  Priority.swift
//  MoQoo
//
//  Created by Jini on 4/18/25.
//

import SwiftUI

enum Priority: Int {
    case high = 0
    case medium = 1
    case low = 2

    var label: String {
        switch self {
        case .high: return "상"
        case .medium: return "중"
        case .low: return "하"
        }
    }

    var color: Color {
        switch self {
        case .high: return .gray
        case .medium: return .blue
        case .low: return .green
        }
    }
}

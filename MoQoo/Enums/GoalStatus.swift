//
//  GoalStatus.swift
//  MoQoo
//
//  Created by Jini on 4/18/25.
//

import SwiftUI

enum GoalStatus: Int {
    case notStarted = 0
    case inProgress = 1
    case completed = 2

    var label: String {
        switch self {
        case .notStarted: return "시작 전"
        case .inProgress: return "진행 중"
        case .completed: return "완료"
        }
    }

    var textColor: Color {
        switch self {
        case .notStarted: return Color(hex: "#F54646")
        case .inProgress: return Color(hex: "#00A99D")
        case .completed: return Color(hex: "#85888A")
        }
    }
    
    var bgColor: Color {
        switch self {
        case .notStarted: return Color(hex: "#FFE7E7")
        case .inProgress: return Color(hex: "#DFF2F1")
        case .completed: return Color(hex: "#E8E8E8")
        }
    }
}

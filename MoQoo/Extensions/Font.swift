//
//  Font.swift
//  MoQoo
//
//  Created by Jini on 4/16/25.
//

import Foundation
import SwiftUI

extension Font {
    enum Moqoo {
        case bold
        case semibold
        case medium
        case regular
        case light
        case custom(String)
        
        var value: String {
            switch self {
            case .bold:
                return "Pretendard-Bold"
            case .semibold:
                return "Pretendard-SemiBold"
            case .medium:
                return "Pretendard-Medium"
            case .regular:
                return "Pretendard-Regular"
            case .light:
                return "Pretendard-Light"
            case .custom(let name):
                return name
            }
        }
    }

    static func mq(_ type: Moqoo, size: CGFloat = 14) -> Font {
        return .custom(type.value, size: size)
    }
}

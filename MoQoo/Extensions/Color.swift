//
//  Color.swift
//  MoQoo
//
//  Created by Jini on 4/13/25.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let r, g, b: UInt64
        switch hex.count {
        case 6: // RGB (without alpha)
            (r, g, b) = ((int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        default:
            (r, g, b) = (1, 1, 1) // Default to white in case of an error
        }
        self.init(
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255
        )
    }
    
    func toHex() -> String? {
        let uiColor = UIColor(self)
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0

        guard uiColor.getRed(&r, green: &g, blue: &b, alpha: &a) else {
            return nil
        }

        let rgb: Int = (Int)(r * 255) << 16 |
                       (Int)(g * 255) << 8 |
                       (Int)(b * 255) << 0

        return String(format: "%06X", rgb)
    }
    
    // 16진수 색상코드 가져와서 커스텀 컬러 지정
    static let mqMain = Color(hex: "#BA98EA")
    static let mqLightMain = Color(hex: "#FDFAFE")
    static let mqGoalBg = Color(hex: "#F5F2F8")
    
    static let mqGray = Color(hex: "#C4C4C4")
    static let mqGraybg = Color(hex: "#F5F6FA")
    static let mqGraytext = Color(hex: "#85888A")
    static let mqGrayPlaceholder = Color(hex: "#BEC4C6")
    
    static let mqGrayStatusBg = Color(hex: "#E8E8E8")
    static let mqGrayStatusText = Color(hex: "#8A8A8A")
    
    static let mqMintBg = Color(hex: "#DFF2F1")
    static let mqMintText = Color(hex: "#00A99D")
}



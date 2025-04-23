//
//  StickBar.swift
//  MoQoo
//
//  Created by Jini on 4/16/25.
//

import SwiftUI

struct StickBar: View {
    
    var progress: Int
    var colorHex: String
    
    var progressColor: Color {
        switch progress {
        case 0:
            return Color(hex: "#E8E8E8")
        case 1..<41:
            return Color(hex: "#E1D5F4")
        case 41..<81:
            return Color(hex: "#D5BDF6")
        case 81..<101:
            return Color(hex: "#BA98EA")
        default:
            return Color(hex: "#BA98EA")
        }
    }
    
    var body: some View {
        ZStack {
            Path { path in
                path.move(to: .zero)
                path.addLine(to: CGPoint(x: 262, y: 0))
            }
            .stroke(Color.mqGrayStatusBg, style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
            
            Path { path in
                path.move(to: .zero)
                path.addLine(to: CGPoint(x: (262 * progress)/100, y: 0))
            }
            .stroke(Color(hex: "#\(colorHex)"), style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
        }
        .frame(width: 262, height: 8)
        
    }
}


//#Preview {
//    VStack(spacing: 20) {
//        StickBar(progress: 0)
//        StickBar(progress: 20)
//        StickBar(progress: 50)
//        StickBar(progress: 85)
//    }
//}

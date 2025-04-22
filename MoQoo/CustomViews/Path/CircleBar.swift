//
//  CircleBar.swift
//  MoQoo
//
//  Created by Jini on 4/16/25.
//

import SwiftUI

struct CircleBar: View {
    
    var progress: Int
    var colorHex: String
    
    var body: some View {
        ZStack {
            Path { path in
                path.addArc(center: CGPoint(x: 60, y: 60),
                            radius: 50,
                            startAngle: .degrees(-90),
                            endAngle: .degrees(270),
                            clockwise: false)
            }
            .stroke(Color.mqGrayStatusBg, style: StrokeStyle(lineWidth: 16, lineCap: .round, lineJoin: .round))
            
            Path { path in
                let startAngle = -90.0
                let endAngle = startAngle + (Double(progress) / 100 * 360.0)
                path.addArc(center: CGPoint(x: 60, y: 60),
                            radius: 50,
                            startAngle: .degrees(Double(startAngle)),
                            endAngle: .degrees(Double(endAngle)),
                            clockwise: false)
            }
            .stroke(Color(hex: "#\(colorHex)"), style: StrokeStyle(lineWidth: 16, lineCap: .round, lineJoin: .round))
        }
        .frame(width: 120, height: 120)
        
    }
}

struct DetailCircleBar: View {
    
    var progress: Int
    var colorHex: String
    
    var body: some View {
        ZStack {
            Path { path in
                path.addArc(center: CGPoint(x: 48, y: 48),
                            radius: 40,
                            startAngle: .degrees(-90),
                            endAngle: .degrees(270),
                            clockwise: false)
            }
            .stroke(Color.mqGrayStatusBg, style: StrokeStyle(lineWidth: 14, lineCap: .round, lineJoin: .round))
            
            Path { path in
                let startAngle = -90.0
                let endAngle = startAngle + (Double(progress) / 100 * 360.0)
                path.addArc(center: CGPoint(x: 48, y: 48),
                            radius: 40,
                            startAngle: .degrees(startAngle),
                            endAngle: .degrees(endAngle),
                            clockwise: false)
            }
            .stroke(Color(hex: "#\(colorHex)"), style: StrokeStyle(lineWidth: 14, lineCap: .round, lineJoin: .round))
        }
        .frame(width: 96, height: 96)
    }
}


#Preview {
    CircleBar(progress: 25, colorHex: "")
}

//
//  GoalCircle.swift
//  MoQoo
//
//  Created by Jini on 4/17/25.
//

import SwiftUI

struct GoalCircle: View {
    var title: String
    var progress: Int
    var color: Color
    
    var body: some View {
        
        VStack {
            Text("\(title)")
                .font(.mq(.medium, size: 12))
                .foregroundColor(.mqGraytext)
            
            Spacer().frame(height: 4)
            
            ZStack {
                Path { path in
                    path.addArc(center: CGPoint(x: 25, y: 25),
                                radius: 20,
                                startAngle: .degrees(-90),
                                endAngle: .degrees(270),
                                clockwise: false)
                }
                .stroke(Color.mqGrayStatusBg, style: StrokeStyle(lineWidth: 7, lineCap: .round, lineJoin: .round))
                
                Path { path in
                    let startAngle = -90.0
                    let endAngle = startAngle + (Double(progress) / 100 * 360.0)
                    path.addArc(center: CGPoint(x: 25, y: 25),
                                radius: 20,
                                startAngle: .degrees(startAngle),
                                endAngle: .degrees(endAngle),
                                clockwise: false)
                }
                .stroke(color, style: StrokeStyle(lineWidth: 7, lineCap: .round, lineJoin: .round))
            }
            .frame(width: 50, height: 50)
            
        }
        .frame(width: 76)
        
    }
}

#Preview {
    GoalCircle(title: "Figma 정복하기", progress: 70, color: Color(hex: "#A6E1DE"))
}

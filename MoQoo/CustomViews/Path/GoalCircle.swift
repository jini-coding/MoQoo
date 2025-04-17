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
                                startAngle: .degrees(360),
                                endAngle: .degrees(0),
                                clockwise: false)
                }
                .stroke(Color.mqGrayStatusBg, style: StrokeStyle(lineWidth: 7, lineCap: .round, lineJoin: .round))
                
                Path { path in
                    path.addArc(center: CGPoint(x: 25, y: 25),
                                radius: 20,
                                startAngle: .degrees(-90),
                                endAngle: .degrees(50),
                                clockwise: false)
                }
                .stroke(color, style: StrokeStyle(lineWidth: 7, lineCap: .round, lineJoin: .round))
            }
            .frame(width: 50, height: 50)
            
        }
        
    }
}

#Preview {
    GoalCircle(title: "Figma 정복하기", progress: 70, color: Color(hex: "#A6E1DE"))
}

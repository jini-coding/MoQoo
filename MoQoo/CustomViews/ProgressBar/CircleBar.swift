//
//  CircleBar.swift
//  MoQoo
//
//  Created by Jini on 4/16/25.
//

import SwiftUI

struct CircleBar: View {
    
    var progress: Int
    
    var body: some View {
        ZStack {
            Path { path in
                path.addArc(center: CGPoint(x: 60, y: 60),
                            radius: 40,
                            startAngle: .degrees(360),
                            endAngle: .degrees(0),
                            clockwise: true)
            }
            .stroke(Color.mqGrayStatusBg, style: StrokeStyle(lineWidth: 16, lineCap: .round, lineJoin: .round))
            
            Path { path in
                path.addArc(center: CGPoint(x: 60, y: 60),
                            radius: 40,
                            startAngle: .degrees(120),
                            endAngle: .degrees(-90),
                            clockwise: true)
            }
            .stroke(Color(hex: "#A6E1DE"), style: StrokeStyle(lineWidth: 16, lineCap: .round, lineJoin: .round))
        }
        .frame(width: 120, height: 120)
        
    }
}


#Preview {
    CircleBar(progress: 25)
}

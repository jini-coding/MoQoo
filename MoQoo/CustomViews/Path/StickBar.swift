//
//  StickBar.swift
//  MoQoo
//
//  Created by Jini on 4/16/25.
//

import SwiftUI

struct StickBar: View {
    
    var progress: Int
    
    var body: some View {
        ZStack {
            Path { path in
                path.move(to: .zero)
                path.addLine(to: .zero)
                path.addLine(to: CGPoint(x: 262, y: 0))
                path.closeSubpath()
            }
            .stroke(Color.mqGrayStatusBg, style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
            
            Path { path in
                path.move(to: .zero)
                path.addLine(to: .zero)
                path.addLine(to: CGPoint(x: (262 * progress)/100, y: 0))
                path.closeSubpath()
            }
            .stroke(Color(hex: "#A6E1DE"), style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
        }
        .frame(width: 262, height: 8)
        
    }
}


#Preview {
    StickBar(progress: 25)
}

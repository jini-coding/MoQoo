//
//  Triangle.swift
//  MoQoo
//
//  Created by Jini on 4/16/25.
//

import SwiftUI

struct Triangle: View {
    
    var body: some View {
        ZStack {
            Path { path in
                path.move(to: .zero)
                path.addLine(to: .zero)
                
                path.addLine(to: CGPoint(x: 11, y: 22))
                path.addLine(to: CGPoint(x: 22, y: 0))
                path.closeSubpath()
            }
            .stroke(Color.mqGrayStatusBg, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
        }
        .frame(width: 120, height: 120)
        
    }
}

#Preview {
    Triangle()
}

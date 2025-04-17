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
                path.move(to: CGPoint(x: 9, y: 0))
                path.addLine(to: CGPoint(x: 0, y: 18))
                path.addLine(to: CGPoint(x: 18, y: 18))
                path.closeSubpath()
            }
            .fill(Color.white)
        }
        .frame(width: 18, height: 18)
        
    }
}

#Preview {
    Triangle()
}

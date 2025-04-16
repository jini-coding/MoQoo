//
//  MainDashboardView.swift
//  MoQoo
//
//  Created by Jini on 4/16/25.
//

import SwiftUI

struct MainDashboardView: View {
    var body: some View {
        ZStack {
            Color.mqGraybg.ignoresSafeArea()
            
            Path { path in
                path.move(to: CGPoint(x: 52, y: 0))
                path.addLine(to: CGPoint(x: 52, y: 92))
                path.closeSubpath()
            }
            .stroke(Color(hex: "#C4C4C4"), style: StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .round))
            
            HStack {
                VStack {//월
                    Text("월")
                        .font(.mq(.semibold, size: 14))
                    
                    Text("14")
                        .font(.mq(.semibold, size: 13))
                    
                    Circle()
                        .fill(.white)
                        .shadow(radius: 1.5)
                        .frame(width: 25, height: 25)
                    
                }
                .padding(.leading, 16)
                
                Spacer()
            }
            
        }
        .frame(height: 92)
        //.background(Color.mqGraybg)
        .cornerRadius(12)
        .padding(.horizontal, 16)
    }
}

struct currentState: View {
    
    var body: some View {
        ZStack {
            
        }
    }
}


#Preview {
    MainDashboardView()
}

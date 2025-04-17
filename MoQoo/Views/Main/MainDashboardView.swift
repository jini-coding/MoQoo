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
            Color.white.ignoresSafeArea()
            
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
                        //.padding(.bottom, 1)
                    
                    Circle()
                        .fill(.white)
                        .shadow(radius: 1.5)
                        .frame(width: 25, height: 25)
                    
                }
                .padding(.leading, 16)
                
//                Divider()
//                    .frame(height: 92)
                    
                
                Spacer().frame(width: 20)
                
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 14) {
                        ForEach(0..<1, id: \.self) { _ in
                            GoalCircle(title: "Figma 정복하기", progress: 25, color: Color(hex: "#A847FF"))
                            
                            GoalCircle(title: "Swift 정복하기", progress: 25, color: Color(hex: "#342353"))
                            
                            GoalCircle(title: "JLPT N3 따기", progress: 25, color: Color(hex: "#EF389E"))
                            
                            GoalCircle(title: "Figma 정복하기", progress: 25, color: Color(hex: "#342353"))
                        }
                    }
                    .frame(width: 311)
                    .padding(.horizontal, 16)
                    .padding(.trailing, 16)
                }
                .scrollIndicators(.hidden)
                .padding(.trailing, 16)
                
                
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

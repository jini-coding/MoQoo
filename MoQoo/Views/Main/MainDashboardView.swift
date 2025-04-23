//
//  MainDashboardView.swift
//  MoQoo
//
//  Created by Jini on 4/16/25.
//

import SwiftUI

struct MainDashboardView: View {
    @EnvironmentObject var dataManager: DataManager
    @Binding var selectedGoalId: String?
    
    var today: Date {
        return Date()
    }
    
    var dayOfWeek: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "E" // 요일
        return formatter.string(from: today)
    }

    var dayNumber: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d" // 일자
        return formatter.string(from: today)
    }
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            Path { path in
                path.move(to: CGPoint(x: 52, y: 0))
                path.addLine(to: CGPoint(x: 52, y: 92))
            }
            .stroke(Color(hex: "#C4C4C4"), style: StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .round))
            
            HStack {
                VStack {//월
                    Text(dayOfWeek)
                        .font(.mq(.semibold, size: 14))
                    
                    Text(dayNumber)
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
                    
                
                Spacer().frame(width: 30)
                
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 14) {
                        ForEach(dataManager.finalGoals) { goal in
                            Button(action: {
                                    selectedGoalId = goal.id // 선택된 goalId 변경
                            }) {
                                GoalCircle(title: goal.title, progress: goal.progress, color: Color(hex: "#\(goal.colorHex)"))
                            }
                            .buttonStyle(.plain)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 6)
                            .background(
                                selectedGoalId == goal.id ? Color.mqGoalBg.opacity(0.7) : Color.clear
                            )
                            .cornerRadius(8)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 8)
//                                    .stroke(
//                                        selectedGoalId == goal.id ? Color.mqMain : Color.clear, lineWidth: 1
//                                    )
//                                    //.shadow(radius: 4)
//                            )
                        }
                    }
                    //.background(Color.mqGray)
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


//#Preview {
//    MainDashboardView()
//        .environmentObject(DataManager())
//}

//
//  FinalGoalListCell.swift
//  MoQoo
//
//  Created by Jini on 4/16/25.
//

import SwiftUI

struct FinalGoalListCell: View {
    @EnvironmentObject var goalViewModel: GoalViewModel

    var title: String
    var detail: String
    var status: Int
    var progress: Int
    var colorHex: String
    var targetDate: Date
    //var endDate: String = ""
    
    var goalStatus: GoalStatus {
        GoalStatus(rawValue: status) ?? .notStarted
    }
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack {
                HStack {
                    ZStack {
                        Circle()
                            .frame(width: 16, height: 16)
                            .foregroundColor(Color(hex: "\(colorHex)"))
                            .padding(.leading, 24)
                        
                        Circle()
                            .frame(width: 5, height: 5)
                            .foregroundColor(.white)
                            .padding(.leading, 24)
                            .offset(x: 2, y: 2)
                    }

                    Text("\(title)")
                        .font(.mq(.medium, size: 16))
                        .padding(.leading, 4)
                    
                    Spacer()
                    
                    Text("⏳ 목표일까지 \(goalViewModel.calculateDday(from: targetDate))")
                        .font(.mq(.medium, size: 14))
                        .foregroundColor(.mqGrayStatusText)
                        .padding(.trailing, 25)
                        .offset(x: 0, y: -2)
                    
//                    Text("\(goalStatus.label)")
//                        .font(.mq(.medium, size: 12))
//                        .padding(.horizontal, 8)
//                        .padding(.vertical, 5)
//                        .background(goalStatus.bgColor)
//                        .foregroundColor(goalStatus.textColor)
//                        .cornerRadius(6)
//                        .padding(.trailing, 25)
//                        .offset(x: 0, y: -2)
                }
                
                Spacer().frame(height: 8)
                
//                HStack {
//                    Text("\(detail)")
//                        .font(.mq(.medium, size: 14))
//                        .foregroundColor(.mqGrayStatusText)
//                        .padding(.leading, 24)
//                    
//                    Spacer()
//                }
                
                Spacer().frame(height: 12)
                
                HStack(spacing: 19) {
                    //바그래프
                    StickBar(progress: progress)
                        .frame(width: 262, height: 8)
                        .padding(.leading, 26)
                    
                    //퍼센트
                    Text("\(progress)%")
                        .font(.mq(.medium, size: 14))
                        .foregroundColor(.mqGrayStatusText)
                        .frame(width: 34)
                        .offset(x: 0, y: -3)
                        .padding(.trailing, 22)
                    
                    //모먼트(시간되면 기록이랑 같이 추가)
                }
            }
            
        }
        //.frame(height: 111)
        .frame(height: 90)
        .cornerRadius(12)
        .padding(.bottom, 14)
        .padding(.horizontal, 16)
    }
}

#Preview {
    GoalView()
        .environmentObject(DataManager())
        .environmentObject(GoalViewModel())
}

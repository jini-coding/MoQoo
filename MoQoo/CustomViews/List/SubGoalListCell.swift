//
//  SubGoalListCell.swift
//  MoQoo
//
//  Created by Jini on 4/18/25.
//

import SwiftUI

struct SubGoalListCell: View {
    var title: String
    var detail: String
    var status: Int
    var leftDay: String
    //var endDate: String = ""
    
    var goalStatus: GoalStatus {
        GoalStatus(rawValue: status) ?? .notStarted
    }
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack {
                Spacer().frame(height: 16)
                
                HStack {
                    
                    Text("\(title)")
                        .font(.mq(.medium, size: 16))
                        .padding(.leading, 24)
                    
                    Spacer()
                    
                    Text("\(leftDay)")
                        .font(.mq(.bold, size: 14))
                        .foregroundColor(Color(hex: "#F54646"))
                        .padding(.trailing, 28)
                }
                
                Spacer().frame(height: 10)
                
                HStack {
                    Text("\(detail)")
                        .font(.mq(.medium, size: 14))
                        .foregroundColor(.mqGrayStatusText)
                        .padding(.leading, 24)
                        .multilineTextAlignment(.leading)
                        .frame(width: 242, alignment: .leading)
                    
                    Spacer()
                    
                }
                Spacer().frame(height: 1)
                
                HStack {
                    Spacer()
                    
                    Text(goalStatus.label)
                        .font(.mq(.medium, size: 12))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 5)
                        .background(goalStatus.bgColor)
                        .foregroundColor(goalStatus.textColor)
                        .cornerRadius(6)
                        .padding(.trailing, 22)
                }
                
                Spacer().frame(height: 16)
            }
            
        }
        .frame(height: 111)
        .cornerRadius(12)
        .padding(.bottom, 22)
        .padding(.horizontal, 16)
    }
}

//#Preview {
//    SubGoalListCell(title: "🔴  단축키 외우기", detail: "기본은 단축키 외우기지!", status: 0, leftDay: 3)
//}

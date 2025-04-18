//
//  TodoCell.swift
//  MoQoo
//
//  Created by Jini on 4/16/25.
//

import SwiftUI

struct TodoCell: View {
    var title: String
    var status: Int
    var leftDay: Int
    
    var goalStatus: GoalStatus {
        GoalStatus(rawValue: status) ?? .notStarted
    }
    
    var body: some View {
        ZStack {
            Color.mqLightMain.ignoresSafeArea()
            
            VStack {
                HStack {
                    Text("\(title)")
                        .font(.mq(.medium, size: 16))
                        .padding(.leading, 22)
                    
                    Spacer()
                    
                    Text("D - \(leftDay)")
                        .font(.mq(.bold, size: 14))
                        .foregroundColor(Color(hex: "#F54646"))
                        .padding(.trailing, 10)
                    
                    Text(goalStatus.label)
                        .font(.mq(.medium, size: 12))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 5)
                        .background(goalStatus.bgColor)
                        .foregroundColor(goalStatus.textColor)
                        .cornerRadius(6)
                        .padding(.trailing, 12)
                    
                }
                
            }
            
        }
        .frame(height: 64)
        .cornerRadius(10)
        .padding(.bottom, 12)
        
    }
}

#Preview {
    MainView()
}


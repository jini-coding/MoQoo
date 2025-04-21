//
//  TaskDetailModalView.swift
//  MoQoo
//
//  Created by Jini on 4/21/25.
//

import SwiftUI

struct TaskDetailModalView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @EnvironmentObject var dataManager: DataManager
    
    //var Task: SubGoal
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack {
                Text("배민 메인 화면 클론하기")
                    .font(.mq(.semibold, size: 18))
                    .foregroundColor(.black)
                
                Spacer().frame(height: 20)

                Text("강의 보고 배달의 민족 메인 화면 클론하기")
                    .font(.mq(.semibold, size: 14))
                    .foregroundColor(.mqGrayStatusText)
                
                Spacer().frame(height: 20)
                
                Text("오토레이아웃 이해하기")
                    .font(.mq(.semibold, size: 14))
                    .foregroundColor(.black)
                
                Spacer().frame(height: 20)
            }
            
        }
        .frame(height: 250)
        .cornerRadius(25)
        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 0)
        .padding(.horizontal, 35)
        .onAppear(
//            dataManager.fetchGoalDetail(goalId: goalId) { fetchedData in
//                self.goalDetail = fetchedData
//            }
        )
    }
}

#Preview {
    TaskDetailModalView()
}

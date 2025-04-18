//
//  MypageView.swift
//  MoQoo
//
//  Created by Jini on 4/13/25.
//

import SwiftUI

struct MypageView: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                Color.white.ignoresSafeArea()
                
                Text("Goal")
                
                NavigationLink(destination: CreateFinalGoalView()) {
                    Text("새로운 목표 생성하기")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.mqMain)
                        .cornerRadius(10)
                }
                
                NavigationLink(destination: EditFinalGoalView(goalId: "", goalName: "", goalDetail: "", targetDate: Date())) {
                    Text("목표 수정하기")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.mqMain)
                        .cornerRadius(10)
                }
                
                NavigationLink(destination: CreateSubGoalView()) {
                    Text("서브 목표 생성하기")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.mqMain)
                        .cornerRadius(10)
                }
                
                NavigationLink(destination: EditSubGoalView(taskId: "", goalName: "", goalDetail: "", targetDate: Date())) {
                    Text("서브 목표 수정하기")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.mqMain)
                        .cornerRadius(10)
                }
                
                Spacer().frame(height: 120)

            }
        }
        
    }
}

#Preview {
    MypageView()
}

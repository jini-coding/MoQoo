//
//  CreateSubGoalView.swift
//  MoQoo
//
//  Created by Jini on 4/16/25.
//

import SwiftUI

struct CreateSubGoalView: View {
    
    @EnvironmentObject var dataManager: DataManager
    
    @State private var goalName: String = ""
    @State private var goalDetail: String = ""
    @State private var targetDate: Date = Date()
    
    @Environment(\.dismiss) var dismiss
    
//    @State private var selectedPriority = "중"
//    let priorities = ["상", "중", "하"]
    
    var body: some View {
        VStack {
            NavigationBar {
                Text("서브 목표 생성")
                    .font(.mq(.semibold, size: 18))
            } leading: {
                Button(action: {
                    dismiss()
                }) {
                    Image("backIcon") }
            }
            
            Spacer().frame(height: 36)
            
            VStack(spacing: 28) {
                InputSection(title: "목표 이름", placeholder: "목표 이름을 입력해주세요", text: $goalName)
                
                InputSection(title: "목표 상세 설명", placeholder: "상세 설명을 입력해주세요", text: $goalDetail, isMultiline: true)
                
                DatePickerSection(title: "목표일", targetDate: $targetDate)
                
                //목표 우선순위
                PrioritySection(title: "우선도")

            }
            
            Spacer()
            
            
            Spacer()
            
            BottomButton(label: "생성") {
                createGoal()
            }
        }
        .navigationBarHidden(true)
        //.navigationTitle("서브 목표 생성")
        
    }
    
    func createGoal() {
        dataManager.createTask(title: goalName, description: goalDetail, targetDate: targetDate, priority: 1)
        print("테스크 생성")
    }
}

#Preview {
    CreateSubGoalView()
}

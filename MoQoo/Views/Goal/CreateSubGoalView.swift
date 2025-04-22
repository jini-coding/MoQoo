//
//  CreateSubGoalView.swift
//  MoQoo
//
//  Created by Jini on 4/16/25.
//

import SwiftUI

struct CreateSubGoalView: View {
    
    @EnvironmentObject var dataManager: DataManager
    @EnvironmentObject var goalViewModel: GoalViewModel
    
    @State private var goalName: String = ""
    @State private var goalDetail: String = ""
    @State private var targetDate: Date = Date()
    @State private var goalNameLength: Int = 0
    @State private var goalDetailLength: Int = 0
    @State private var showCompleteModal: Bool = false
    
    let finalGoalId: String
    
    @Environment(\.dismiss) var dismiss
    
//    @State private var selectedPriority = "중"
//    let priorities = ["상", "중", "하"]
    
    var body: some View {
        ZStack {
            VStack {
    //            NavigationBar {
    //                Text("서브 목표 생성")
    //                    .font(.mq(.semibold, size: 18))
    //            } leading: {
    //                Button(action: {
    //                    dismiss()
    //                }) {
    //                    Image("backIcon") }
    //            }
                
                Spacer().frame(height: 28)
                
                Text("테스크 생성")
                    .font(.mq(.semibold, size: 18))
                
                Spacer().frame(height: 28)
                
                VStack(spacing: 2) {
                    InputSection(title: "목표 이름", placeholder: "목표 이름을 입력해주세요", text: $goalName, textLength: $goalNameLength, lengthLimit: 14)
                    
                    InputSection(title: "목표 상세 설명", placeholder: "상세 설명을 입력해주세요", text: $goalDetail, textLength: $goalDetailLength, lengthLimit: 60, isMultiline: true)
                    
                    DatePickerSection(title: "목표일", targetDate: $targetDate)
                    
                    //목표 우선순위
                    //PrioritySection(title: "우선도")

                }
                
                Spacer()
                
                
                Spacer()
                
                BottomButton(label: "생성") {
                    createGoal()
                }
            }
            .navigationBarHidden(true)
            //.navigationTitle("서브 목표 생성")
            .onAppear {
                print("[LOG] CreateSubGoalView appeared!")
            }
            if showCompleteModal {
                CreateTaskCompleteModalView()
            }
        }

        
    }
    
    func createGoal() {
        withAnimation {
            showCompleteModal = true
        }
        dataManager.createTask(finalGoalId: finalGoalId, title: goalName, description: goalDetail, targetDate: targetDate, priority: 1)
        print("테스크 생성")
    }
}

//#Preview {
//    CreateSubGoalView(goalName: "", goalDetail: "", targetDate: Date())
//}

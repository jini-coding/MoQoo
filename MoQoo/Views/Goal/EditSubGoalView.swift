//
//  EditSubGoalView.swift
//  MoQoo
//
//  Created by Jini on 4/16/25.
//

import SwiftUI

struct EditSubGoalView: View {
    @EnvironmentObject var dataManager: DataManager
    
    let finalGoalId: String
    let taskId: String
    
    @State var goalName: String
    @State var goalDetail: String
    @State var targetDate: Date
    
    @State private var taskDetail: SubGoal? = nil
    @State private var goalNameLength: Int = 0
    @State private var goalDetailLength: Int = 0
    @State private var showCompleteModal: Bool = false
    
    @Environment(\.dismiss) var dismiss
    
//    @State private var selectedPriority = "중"
//    let priorities = ["상", "중", "하"]
    
    var body: some View {
        ZStack {
            VStack {
//                NavigationBar {
//                    Text("테스크 수정")
//                        .font(.mq(.semibold, size: 18))
//                } leading: {
//                    Button(action: {
//                        dismiss()
//                    }) {
//                        Image("backIcon") }
//                }
                
                Spacer().frame(height: 28)
                
                Text("서브 목표 수정") //테스크
                    .font(.mq(.semibold, size: 18))
                
                Spacer().frame(height: 28)
                
                VStack(spacing: 2) {
                    InputSection(title: "목표 이름", placeholder: "목표 이름을 입력해주세요", text: $goalName, textLength: $goalNameLength, lengthLimit: 14)
                    
                    InputSection(title: "상세 설명", placeholder: "상세 설명을 입력해주세요", text: $goalDetail, textLength: $goalDetailLength, lengthLimit: 40, isMultiline: true)
                    
                    DatePickerSection(title: "목표일", placeholder: "목표일을 설정해주세요", targetDate: $targetDate)
                    
                }
                
                Spacer()
                
                
                Spacer()
                
                BottomButton(label: "완료",
                             action: { editTask() }, isEnabled: true
                )
            }
            .navigationBarHidden(true)
            //.navigationTitle("서브 목표 수정")
            .onAppear {
                goalNameLength = goalName.count
                goalDetailLength = goalDetail.count
                dataManager.fetchTaskDetail(taskId: taskId) { fetchedData in
                    self.taskDetail = fetchedData
                }
            }
            if showCompleteModal {
                CompleteModalView(task: 3)
            }
            
        }

    }
    
    func editTask() {
        print("골 수정")
        withAnimation {
            showCompleteModal = true
        }
        dataManager.editTask(taskId: taskId, title: goalName, description: goalDetail, status: 2, targetDate: targetDate)
    }
}

//#Preview {
//    EditSubGoalView()
//}

//
//  EditSubGoalView.swift
//  MoQoo
//
//  Created by Jini on 4/16/25.
//

import SwiftUI

struct EditSubGoalView: View {
    @EnvironmentObject var dataManager: DataManager
    
    let taskId: String
    
    @State var goalName: String
    @State var goalDetail: String
    @State var targetDate: Date
    
    @State private var goalNameLength: Int = 0
    @State private var goalDetailLength: Int = 0
    
    @Environment(\.dismiss) var dismiss
    
//    @State private var selectedPriority = "중"
//    let priorities = ["상", "중", "하"]
    
    var body: some View {
        VStack {
            NavigationBar {
                Text("서브 목표 수정")
                    .font(.mq(.semibold, size: 18))
            } leading: {
                Button(action: {
                    dismiss()
                }) {
                    Image("backIcon") }
            }
            
            Spacer().frame(height: 36)
            
            VStack(spacing: 28) {
                InputSection(title: "목표 이름", placeholder: "목표 이름을 입력해주세요", text: $goalName, textLength: $goalNameLength)
                
                InputSection(title: "목표 상세 설명", placeholder: "상세 설명을 입력해주세요", text: $goalDetail, textLength: $goalDetailLength, isMultiline: true)
                
                DatePickerSection(title: "목표일", targetDate: $targetDate)

            }
            
            Spacer()
            
            
            Spacer()
            
            BottomTwoButton(cancelLabel: "취소", cancelAction: {}, 
                            confirmLabel: "완료", confirmAction: { editTask() })
        }
        .navigationBarHidden(true)
        //.navigationTitle("서브 목표 수정")
        
    }
    
    func editTask() {
        print("골 수정")
        dataManager.editTask(taskId: taskId, title: goalName, description: goalDetail, targetDate: targetDate)
    }
}

//#Preview {
//    EditSubGoalView()
//}

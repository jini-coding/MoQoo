//
//  EditFinalGoalView.swift
//  MoQoo
//
//  Created by Jini on 4/16/25.
//

import SwiftUI

struct EditFinalGoalView: View {
    @EnvironmentObject var dataManager: DataManager
    
    let goalId: String
    
    @State var goalName: String
    @State var goalDetail: String
    @State var targetDate: Date
    
    @State private var goalNameLength: Int = 0
    @State private var goalDetailLength: Int = 0
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            NavigationBar {
                Text("목표 수정")
                    .font(.mq(.semibold, size: 18))
            } leading: {
                Button(action: {
                    dismiss()
                }) {
                    Image("backIcon") }
            }
            
            Circle()
                .frame(width: 84, height: 84)
                .foregroundColor(.mqGrayPlaceholder)
            
            Spacer().frame(height: 20)
            
            VStack(spacing: 28) {
                InputSection(title: "목표 이름", placeholder: "목표 이름을 입력해주세요", text: $goalName, textLength: $goalNameLength, lengthLimit: 14)
                
                InputSection(title: "상세 설명 및 다짐", placeholder: "상세 설명을 입력해주세요", text: $goalDetail, textLength: $goalDetailLength, lengthLimit: 100, isMultiline: true)
                
                DatePickerSection(title: "목표일", targetDate: $targetDate)
            }
            
            Spacer()
            
            Spacer()
            
            BottomTwoButton(cancelLabel: "취소", cancelAction: {},
                            confirmLabel: "완료", confirmAction: {editGoal()}
            )
        }
        .navigationBarHidden(true)
        .onAppear {
            print("[LOG] EditFinalGoalView appeared!")
            //dataManager.fetchGoalDetail(id: goalId) 오류...
        }
        //.navigationTitle("목표 수정")
        
    }
    
    func editGoal() {
        print("골 수정")
        dataManager.editFinalGoal(goalId: goalId, title: goalName, description: goalDetail, targetDate: targetDate)
    }
    
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
}

//#Preview {
//    EditFinalGoalView(goalId: 1, goalName: "", goalDetail: "", period: "")
//}

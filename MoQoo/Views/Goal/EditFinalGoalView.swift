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
    @State var goalResolution: String
    @State var targetDate: Date
    @State var colorHex: String
    
    @State private var goalNameLength: Int = 0
    @State private var goalDetailLength: Int = 0
    @State private var resolutionLength: Int = 0
    @State private var showCompleteModal: Bool = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        ZStack {
            editview
            
            if showCompleteModal {
                CompleteModalView(task: 3)
            }
        }

        
    }
    
    var editview: some View {
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
            
            Spacer().frame(height: 24)
            
            VStack(spacing: 2) {
                InputSection(title: "목표 이름", placeholder: "목표 이름을 입력해주세요", text: $goalName, textLength: $goalNameLength, lengthLimit: 8)
                
                InputSection(title: "상세 설명", placeholder: "상세 설명을 입력해주세요", text: $goalDetail, textLength: $goalDetailLength, lengthLimit: 40, isMultiline: true)
                
                //InputSection(title: "나의 다짐", placeholder: "목표에 임하는 나의 다짐을 입력해주세요", text: $goalResolution, textLength: $resolutionLength, lengthLimit: 25)
                
                DatePickerSection(title: "목표일", placeholder: "목표일을 설정해주세요", targetDate: $targetDate)
                
                ColorPickerSection(title: "색상", colorHex: $colorHex)
//                InputSection(title: "목표 이름", placeholder: "목표 이름을 입력해주세요", text: $goalName, textLength: $goalNameLength, lengthLimit: 14)
//                
//                InputSection(title: "상세 설명 및 다짐", placeholder: "상세 설명을 입력해주세요", text: $goalDetail, textLength: $goalDetailLength, lengthLimit: 100, isMultiline: true)
//                
//                DatePickerSection(title: "목표일", targetDate: $targetDate)
            }
            
            Spacer()
            
            Spacer()
            
            BottomButton(label: "완료", 
                         action: { editGoal() }, isEnabled: true
            )
        }
        .navigationBarHidden(true)
        .onAppear {
            goalNameLength = goalName.count
            goalDetailLength = goalDetail.count
            //resolutionLength = goalResolution.count
            print("EditFinalGoalView appeared!")
            //dataManager.fetchGoalDetail(id: goalId) 오류...
        }
        //.navigationTitle("목표 수정")
    }
    
    func editGoal() {
        print("골 수정")
        withAnimation {
            showCompleteModal = true
        }
        dataManager.editFinalGoal(goalId: goalId, title: goalName, description: goalDetail, targetDate: targetDate, colorHex: colorHex)
        print("골 수정완료!!!!---")
    }
    
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
}

//#Preview {
//    EditFinalGoalView(goalId: "", goalName: "", goalDetail: "", goalResolution: "", targetDate: Date())
//}

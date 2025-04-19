//
//  CreateFinalGoalView.swift
//  MoQoo
//
//  Created by Jini on 4/16/25.
//

import SwiftUI

struct CreateFinalGoalView: View {
    @EnvironmentObject var dataManager: DataManager
    @Environment(\.dismiss) var dismiss
    
    @State private var goalName: String = ""
    @State private var goalDetail: String = ""
    @State private var goalResolution: String = ""
    @State private var targetDate: Date = Date()
    
    @State private var goalNameLength: Int = 0
    @State private var goalDetailLength: Int = 0
    @State private var resolutionLength: Int = 0
    
    var body: some View {
        VStack {
            NavigationBar {
                Text("목표 생성")
                    .font(.mq(.semibold, size: 18))
            } leading: {
                Button(action: {
                    dismiss()
                }) {
                    Image("backIcon") }
            }
            
            Spacer().frame(height: 24)
            
            VStack(spacing: 2) {
                InputSection(title: "목표 이름", placeholder: "목표 이름을 입력해주세요", text: $goalName, textLength: $goalNameLength, lengthLimit: 14)
                
                InputSection(title: "상세 설명", placeholder: "상세 설명을 입력해주세요", text: $goalDetail, textLength: $goalDetailLength, lengthLimit: 25)
                
                InputSection(title: "나의 다짐", placeholder: "목표에 임하는 나의 다짐을 입력해주세요", text: $goalResolution, textLength: $resolutionLength, lengthLimit: 25)
                
                DatePickerSection(title: "목표일", targetDate: $targetDate)
                
                DatePickerSection(title: "색상", targetDate: $targetDate)
            }
            
            Spacer()
            
            Spacer()
            
            BottomButton(label: "생성") {
                createGoal()
            }
        }
        .navigationBarHidden(true)
        //.navigationTitle("목표 생성")
        
    }
    
    func createGoal() {
        dataManager.createFinalGoal(title: goalName, description: goalDetail, targetDate: targetDate)
        print("골 생성")
    }
}

#Preview {
    CreateFinalGoalView()
}

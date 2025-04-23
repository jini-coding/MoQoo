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
    @State private var targetDate: Date = Calendar.current.startOfDay(for: Date())
    @State private var colorHex: String = "FF0000"
    
    @State private var goalNameLength: Int = 0
    @State private var goalDetailLength: Int = 0
    @State private var resolutionLength: Int = 0
    @State private var showCompleteModal: Bool = false
    @State private var tabBarVisible: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                NavigationBar {
                    Text("목표 생성")
                        .font(.mq(.semibold, size: 18))
                } leading: {
                    Button(action: {
                        self.tabBarVisible = true
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
                }
                
                Spacer()
                
                Spacer()
                
                BottomButton(label: "생성") {
                    createGoal()
                }
            }
            .navigationBarHidden(true)
            //.navigationTitle("목표 생성")
            
            if showCompleteModal {
                CompleteModalView(task: 1, title: goalName, colorHex: colorHex)
            }
        }
        
    }
    
    func createGoal() {
        withAnimation {
            showCompleteModal = true
        }
        dataManager.createFinalGoal(title: goalName, description: goalDetail, targetDate: targetDate, colorHex: colorHex)
        print("골 생성")
    }
}

#Preview {
    CreateFinalGoalView()
}

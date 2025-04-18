//
//  EditSubGoalView.swift
//  MoQoo
//
//  Created by Jini on 4/16/25.
//

import SwiftUI

struct EditSubGoalView: View {
    @State private var goalName: String = ""
    @State private var goalDetail: String = ""
    @State private var period: String = ""
    
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
                
                InputSection(title: "목표 기간", placeholder: "목표 기간을 설정해주세요", text: $period)
                
                //목표 우선순위
                PrioritySection(title: "우선도")

            }
            
            Spacer()
            
            
            Spacer()
            
            BottomTwoButton(cancelLabel: "취소", cancelAction: {}, confirmLabel: "완료", confirmAction: {})
        }
        .navigationBarHidden(true)
        //.navigationTitle("서브 목표 수정")
        
    }
    
    func createGoal() {
        print("골 생성")
    }
}

#Preview {
    EditSubGoalView()
}

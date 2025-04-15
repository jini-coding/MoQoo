//
//  EditFinalGoalView.swift
//  MoQoo
//
//  Created by Jini on 4/16/25.
//

import SwiftUI

struct EditFinalGoalView: View {
    @State private var goalName: String = ""
    @State private var goalDetail: String = ""
    @State private var period: String = ""
    
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
                    Image(systemName: "chevron.left") }
            }
            
            Circle()
                .frame(width: 84, height: 84)
                .foregroundColor(.mqGrayPlaceholder)
            
            Spacer().frame(height: 20)
            
            VStack(spacing: 28) {
                InputSection(title: "목표 이름", placeholder: "목표 이름을 입력해주세요", text: $goalName)
                
                InputSection(title: "상세 설명 및 다짐", placeholder: "상세 설명을 입력해주세요", text: $goalDetail, isMultiline: true)
                
                InputSection(title: "목표 기간", placeholder: "목표 기간을 설정해주세요", text: $period)
            }
            
            Spacer()
            
            Spacer()
            
            BottomTwoButton(cancelLabel: "취소", cancelAction: {}, confirmLabel: "완료", confirmAction: {})
        }
        .navigationBarHidden(true)
        //.navigationTitle("목표 수정")
        
    }
    
    func editGoal() {
        print("골 생성")
    }
}

#Preview {
    EditFinalGoalView()
}

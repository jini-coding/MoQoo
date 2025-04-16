//
//  PrioritySection.swift
//  MoQoo
//
//  Created by Jini on 4/16/25.
//

import SwiftUI

struct PrioritySection: View {
    @State private var selectedPriority = "중"  // 기본 선택 값
    
    let priorities = ["상", "중", "하"]
    
    var title: String
    
    var body: some View {
        VStack {
            InputText(text: title)
                .padding(.bottom, 4)
            
            Picker("우선순위 선택", selection: $selectedPriority) {
                ForEach(priorities, id: \.self) { priority in
                    Text(priority)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal, 16)
            
            // 스타일 수정하기 (배경색)
        }
    }
}


#Preview {
    PrioritySection(title: "우선도")
}

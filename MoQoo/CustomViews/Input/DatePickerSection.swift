//
//  DatePickerSection.swift
//  MoQoo
//
//  Created by Jini on 4/18/25.
//

import SwiftUI

struct DatePickerSection: View {
    
    var title: String
    @Binding var targetDate: Date
    
    var body: some View {
        VStack {
            InputText(text: title)
                .padding(.bottom, 4)
            
            DatePicker("날짜 선택", selection: $targetDate, displayedComponents: .date)
                .labelsHidden()
                .padding()
                .background(Color.mqGrayPlaceholder.opacity(0.2))
                .cornerRadius(10)
            
            // 스타일 수정하기 (배경색)
        }
    }
}


#Preview {
    StatefulPreviewWrapper(Date()) { date in
        DatePickerSection(title: "목표일", targetDate: date)
    }
}

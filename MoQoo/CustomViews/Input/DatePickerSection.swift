//
//  DatePickerSection.swift
//  MoQoo
//
//  Created by Jini on 4/18/25.
//

import SwiftUI

struct DatePickerSection: View {
    
    var title: String
    var placeholder: String
    @Binding var targetDate: Date
    
    @State private var showDatePicker = false
    
    var dateClosedRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .month, value: -1, to: Date())!
        let max = Calendar.current.date(byAdding: .year, value: 5, to: Date())!
        return min...max
    }
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy년 M월 d일"
        return formatter
    }
    
    func formattedDateString(date: Date) -> String {
        return dateFormatter.string(from: date)
    }
    
    var body: some View {
        VStack {
            InputText(text: title)
                .padding(.bottom, 4)
            
//            InputTextField(placeholder: placeholder, text: $text)
//            
//            Button(action: {
//                showDatePicker = true
//            }) {
//                HStack {
//                    Text(formattedDateString.isEmpty ? placeholder : formattedDateString)
//                        .foregroundColor(formattedDateString.isEmpty ? .gray : .black)
//                }
//                .padding(.vertical, 12)
//                .padding(.horizontal, 16)
//                .background(Color.mqGraybg)
//                .cornerRadius(10)
//            }
//            .sheet(isPresented: $showDatePicker) {
//                VStack {
//                    DatePicker(
//                        "날짜 선택",
//                        selection: $targetDate,
//                        in: dateClosedRange,
//                        displayedComponents: .date
//                    )
//                    .datePickerStyle(.compact)
//                    .labelsHidden()
//                    .padding()
//                    
//                    Button("선택 완료") {
//                        showDatePicker = false
//                    }
//                    .padding(.bottom)
//                }
//                .presentationDetents([.height(300)])
//            }
            DatePicker("날짜 선택", selection: $targetDate, in: dateClosedRange, displayedComponents: .date)
                .labelsHidden()
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity)
                .background(Color.mqGraybg)
                .cornerRadius(10)
                .padding(.horizontal, 16)
                .datePickerStyle(.compact)
            
            // 스타일 수정하기
        }
        .padding(.bottom, 20)
    }
}


#Preview {
    CreateFinalGoalView()
}

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
    
    var defaultDate: Date {
        Calendar.current.startOfDay(for: Date())
    }
    
    var displayDateText: String {
        Calendar.current.isDate(targetDate, inSameDayAs: defaultDate) ?
        "목표 마감일을 선택해주세요" :
        formatDateToString(targetDate)
    }
    
    var body: some View {
        VStack {
            InputText(text: title)
                .padding(.bottom, 4)
            
//            InputTextField(placeholder: placeholder, text: $text)
            
            ZStack {
                Text(displayDateText)
                    .foregroundColor(targetDate == defaultDate ? Color(hex: "#BEC4C6") : .black)
                    .padding(.horizontal, 20)
                    .frame(height: 52)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.mqGraybg)
                    .cornerRadius(8)
                    .padding(.horizontal, 16)
                
                HStack { //야매...
                    DatePicker(
                        "",
                        selection: $targetDate, in: dateClosedRange, displayedComponents: .date)
                    .datePickerStyle(.compact)
                    .labelsHidden()
                    .tint(.mqMain)
                    .colorMultiply(.clear)
                    
                    DatePicker(
                        "",
                        selection: $targetDate, in: dateClosedRange, displayedComponents: .date)
                    .datePickerStyle(.compact)
                    .labelsHidden()
                    .tint(.mqMain)
                    .colorMultiply(.clear)
                }

            }

//            DatePicker("날짜 선택", selection: $targetDate, in: dateClosedRange, displayedComponents: .date)
//                .labelsHidden()
//                .padding(.vertical, 12)
//                .frame(maxWidth: .infinity)
//                .background(Color.mqGraybg)
//                .cornerRadius(8)
//                .padding(.horizontal, 16)
//                .datePickerStyle(.compact)
//                .colorMultiply(.clear)
            
            // 스타일 수정하기
        }
        .padding(.bottom, 20)
    }
    
    func formatDateToString(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy년 M월 d일"
        return formatter.string(from: date)
    }
}


#Preview {
    CreateFinalGoalView()
}

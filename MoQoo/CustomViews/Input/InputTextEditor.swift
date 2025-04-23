//
//  InputTextEditor.swift
//  MoQoo
//
//  Created by Jini on 4/16/25.
//

import SwiftUI

struct InputTextEditor: View {
    var placeholder: String = ""
    @Binding var text: String
    var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(.mqGrayPlaceholder)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 20)
                    .opacity(text.isEmpty ? 1 : 0)
            }
            
            TextEditor(text: $text)
                .keyboardType(keyboardType)
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(Color.clear)
                .cornerRadius(8)
                .scrollContentBackground(.hidden) //editor 영역 배경색 없애기
                .frame(height: 86)
        }
        .background(Color.mqGraybg)
        .cornerRadius(8)
        .padding(.horizontal, 16)
    }
}

#Preview {
    StatefulPreviewWrapper("") { binding in
        InputTextEditor(placeholder: "다짐을 입력해주세요", text: binding)
    }
}

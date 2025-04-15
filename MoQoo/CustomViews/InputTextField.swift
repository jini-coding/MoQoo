//
//  InputTextField.swift
//  MoQoo
//
//  Created by Jini on 4/16/25.
//

import SwiftUI

struct InputTextField: View {
    var placeholder: String = ""
    @Binding var text: String
    var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        TextField(placeholder, text: $text)
            .keyboardType(keyboardType)
            .padding(.horizontal, 20)
            .padding(.vertical, 15)
            .background(Color.mqGraybg)
            .cornerRadius(8)
            .padding(.horizontal, 16)
    }
}

#Preview {
//    InputTextField(placeholder: "이름을 입력해주세요", text: "")
    StatefulPreviewWrapper("") { binding in
        InputTextField(placeholder: "이름을 입력해주세요", text: binding)
    }
}

struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State private var value: Value
    private var content: (Binding<Value>) -> Content

    init(_ value: Value, content: @escaping (Binding<Value>) -> Content) {
        _value = State(initialValue: value)
        self.content = content
    }

    var body: some View {
        content($value)
    }
}

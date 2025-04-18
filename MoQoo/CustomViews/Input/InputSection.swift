//
//  InputSection.swift
//  MoQoo
//
//  Created by Jini on 4/16/25.
//

import SwiftUI

struct InputSection: View {
    var title: String
    var placeholder: String
    @Binding var text: String
    @Binding var textLength: Int
    var isMultiline: Bool = false
    
    var body: some View {
        VStack {
            InputText(text: title)
                .padding(.bottom, 4)
            
            if isMultiline {
                InputTextEditor(placeholder: placeholder, text: $text)
                    .onChange(of: text) { newValue in
                        textLength = newValue.count
                        if newValue.count > 14 {
                            text = String(newValue.prefix(14))
                        }
                    }
            } else {
                InputTextField(placeholder: placeholder, text: $text)
                    .onChange(of: text) { newValue in
                        textLength = newValue.count
                        if newValue.count > 14 {
                            text = String(newValue.prefix(14))
                        }
                    }
            }
            
            HStack {
                Spacer()
                
                Text("\(textLength)/14")
                    .font(.mq(.medium, size: 14))
                    .foregroundColor(.mqGraytext)
                    .padding(.trailing, 24)
            }
        }
    }
}

#Preview {
    CreateFinalGoalView()
}


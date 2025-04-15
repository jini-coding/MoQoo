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
    var isMultiline: Bool = false
    
    var body: some View {
        VStack {
            InputText(text: title)
                .padding(.bottom, 4)
            
            if isMultiline {
                InputTextEditor(placeholder: placeholder, text: $text)
            } else {
                InputTextField(placeholder: placeholder, text: $text)
            }
            
            
        }
    }
}


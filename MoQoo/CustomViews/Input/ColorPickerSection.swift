//
//  ColorPickerSection.swift
//  MoQoo
//
//  Created by Jini on 4/21/25.
//

import SwiftUI

struct ColorPickerSection: View {
    var title: String
    @Binding var colorHex: String
    
    var body: some View {
        let bindingColor = Binding<Color>(
            get: { Color(hex: colorHex) ?? .black },
            set: { newColor in
                colorHex = newColor.toHex() ?? "000000"
            }
        )
        
        return VStack {
            InputText(text: title)
                .padding(.bottom, 4)
            
            HStack {
                ColorPicker("", selection: bindingColor, supportsOpacity: false)
                    .labelsHidden()
                    .padding(.vertical, 12)
                    .frame(width: 114)
                    .background(Color.mqGraybg)
                    .cornerRadius(10)
                    .padding(.leading, 16)
                
                Spacer()
            }

//            Text("HEX: #\(colorHex)")
//                .font(.caption)
//                .foregroundColor(.gray)
        }
    }
}

#Preview {
    CreateFinalGoalView()
}

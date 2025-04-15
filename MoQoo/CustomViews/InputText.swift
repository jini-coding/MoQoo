//
//  InputText.swift
//  MoQoo
//
//  Created by Jini on 4/16/25.
//

import SwiftUI

struct InputText: View {
    var text: String
    
    var body: some View {
        HStack {
            Text("\(text)")
                .font(.mq(.medium, size: 14))
                .foregroundColor(.mqGraytext)
            
            Spacer()
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    InputText(text: "목표 이름")
}

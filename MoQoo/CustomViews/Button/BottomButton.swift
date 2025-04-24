//
//  BottomButton.swift
//  MoQoo
//
//  Created by Jini on 4/15/25.
//

import SwiftUI

struct BottomButton: View {
    var label: String
    var action: () -> Void
    var isEnabled: Bool
    
    var body: some View {
        Button(action: {
            if isEnabled {
                action()
            }
        }) {
            ZStack {
                // 버튼 배경
                (isEnabled ? Color.mqMain : Color.mqGrayStatusBg)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                
                // 텍스트
                Text(label)
                    .font(.mq(.semibold, size: 18))
                    .foregroundColor(isEnabled ? .white : .mqGray)
                
            }
            .frame(height: 52)
            .padding(.horizontal, 16)
            
            .disabled(!isEnabled)
        }
    }
}


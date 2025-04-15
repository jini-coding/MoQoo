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
    
    var body: some View {
        Button(action: action) {
            ZStack {
                // 버튼 배경
                Color.mqMain
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
                // 텍스트
                Text(label)
                    .font(.mq(.semibold, size: 18))
                    .foregroundColor(.white)
                
            }
            .frame(height: 52)
            .padding(.horizontal, 16)
            
            //이후에 활성화 조건 추가
        }
    }
}

#Preview {
    BottomButton(label: "생성하기", action: {})
}

//
//  BottomTwoButton.swift
//  MoQoo
//
//  Created by Jini on 4/16/25.
//

import SwiftUI

struct BottomTwoButton: View {
    var cancelLabel: String
    var cancelAction: () -> Void
    
    var confirmLabel: String
    var confirmAction: () -> Void
    
    var body: some View {
        HStack(spacing: 13) {
            Button(action: cancelAction) {
                ZStack {
                    // 버튼 배경
                    Color.white
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    // 텍스트
                    Text(cancelLabel)
                        .font(.mq(.semibold, size: 18))
                        .foregroundColor(.mqMain)
                    
                }
                .frame(height: 52)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.mqMain, lineWidth: 1)
                        .frame(height: 52)
                )
                .padding(.leading, 16)
                
                //이후에 활성화 조건 추가
            }
            
            Button(action: confirmAction) {
                ZStack {
                    // 버튼 배경
                    Color.mqMain
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    // 텍스트
                    Text(confirmLabel)
                        .font(.mq(.semibold, size: 18))
                        .foregroundColor(.white)
                    
                }
                .frame(height: 52)
                .padding(.trailing, 16)
                
                //이후에 활성화 조건 추가
            }
        }
        
    }
}

#Preview {
    BottomTwoButton(cancelLabel: "취소", cancelAction: {}, confirmLabel: "완료", confirmAction: {})
}

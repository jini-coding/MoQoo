//
//  CompleteDeleteModalView.swift
//  MoQoo
//
//  Created by Jini on 4/21/25.
//

import SwiftUI

struct CompleteDeleteModalView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack {
                Text("목표가 삭제되었습니다")
                    .font(.mq(.semibold, size: 20))
                    .foregroundColor(.black)
                
                Spacer().frame(height: 30)
                
                ModalBottomButton(
                    label: "확인",
                    action: {
                        dismiss()
                    }
                )
                
            }
            
        }
        .frame(height: 150)
        .cornerRadius(25)
        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 0)
        .padding(.horizontal, 35)
    }
}

#Preview {
    CompleteDeleteModalView()
}

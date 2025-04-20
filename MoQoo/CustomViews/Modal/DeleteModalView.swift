//
//  DeleteModalView.swift
//  MoQoo
//
//  Created by Jini on 4/21/25.
//

import SwiftUI

struct DeleteModalView: View {
    
    var title: String
    var deleteButtonTapped: () -> Void
    var cancelButtonTapped: () -> Void
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack {
                Spacer().frame(height: 20)
                
                Text("[\(title)]")
                    .font(.mq(.semibold, size: 20))
                    .foregroundColor(.black)
                    .padding(.bottom, 2)
                
                Text("목표를 정말 삭제하시겠어요?")
                    .font(.mq(.semibold, size: 20))
                    .foregroundColor(.black)
                
                Spacer().frame(height: 20)
                
                Text("하위에 생성된 서브 목표들도 모두 삭제돼요")
                    .font(.mq(.medium, size: 16))
                    .foregroundColor(.black)
                    .padding(.horizontal, 20) //여기 왜 이런걸까..?
                    .multilineTextAlignment(.leading)
                
                Spacer().frame(height: 20)
                
                ModalBottomTwoButton(cancelLabel: "삭제",
                                     cancelAction: deleteButtonTapped,
                                     confirmLabel: "취소",
                                     confirmAction: cancelButtonTapped
                )
                .padding(.bottom, 20)
                
            }
            
        }
        .frame(height: 210)
        .cornerRadius(25)
        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 0)
        .padding(.horizontal, 35)
    }
}

#Preview {
    DeleteModalView(title: "dfs", deleteButtonTapped: {}, cancelButtonTapped: {})
}

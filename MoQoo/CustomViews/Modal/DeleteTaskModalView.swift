//
//  DeleteTaskModalView.swift
//  MoQoo
//
//  Created by Jini on 4/23/25.
//

import SwiftUI

struct DeleteTaskModalView: View {
    
    @Binding var title: String?
    var cancelButtonTapped: () -> Void
    var deleteButtonTapped: () -> Void
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack {
                Spacer().frame(height: 20)
                
                Text("[\(title ?? "선택한")]")
                    .font(.mq(.semibold, size: 20))
                    .foregroundColor(.black)
                    .padding(.bottom, 2)
                
                Text("테스크를 정말 삭제하시겠어요?")
                    .font(.mq(.semibold, size: 20))
                    .foregroundColor(.black)
                
                Spacer().frame(height: 20)
                
                ModalBottomTwoButton(cancelLabel: "취소",
                                     cancelAction: cancelButtonTapped,
                                     confirmLabel: "삭제",
                                     confirmAction: deleteButtonTapped
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

//#Preview {
//    DeleteTaskModalView(title: "", cancelButtonTapped: {}, deleteButtonTapped: {})
//}

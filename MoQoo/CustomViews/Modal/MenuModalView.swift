//
//  MenuModalView.swift
//  MoQoo
//
//  Created by Jini on 4/20/25.
//

import SwiftUI

struct MenuModalView: View {
    var editButtonTapped: () -> Void
    var deleteButtonTapped: () -> Void
    
    var body: some View {
        goalMenuView
    }
    
    var goalMenuView: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack(spacing: 9) {
                Button(action: {
                    editButtonTapped()
                }) {
                    HStack {
                        Image("editIcon")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(.leading, 14)
                        
                        Spacer()
                        
                        Text("수정하기")
                            .font(.mq(.medium, size: 14))
                            .foregroundColor(.mqGrayStatusText)
                            .padding(.trailing, 22)
                    }
                //NavigationLink(destination: CreateSubGoalView(finalGoalId: "")) {
                    
                }
                
                Divider()
                    .foregroundColor(Color(hex: "#ECECED"))
                
                Button(action: {
                    deleteButtonTapped()
                }) {
                    HStack {
                        Image("trashIcon")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(.leading, 14)
                        
                        Spacer()
                        
                        Text("삭제하기")
                            .font(.mq(.medium, size: 14))
                            .foregroundColor(.mqGrayStatusText)
                            .padding(.trailing, 22)
                    }
                }
                
            }
            
        }
        .frame(width: 121, height: 76)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 0)
        .offset(x: 120, y: -255)
        //.offset(x: 120, y: -290)
    }
}

#Preview {
    MenuModalView(editButtonTapped: {}, deleteButtonTapped: {})
}

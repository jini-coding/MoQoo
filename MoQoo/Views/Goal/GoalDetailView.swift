//
//  GoalDetailView.swift
//  MoQoo
//
//  Created by Jini on 4/17/25.
//

import SwiftUI

struct GoalDetailView: View {
    var title: String
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack {
                NavigationBar {
                    Text("목표 상세 보기")
                        .font(.mq(.semibold, size: 18))
                } leading: {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left") }
                } trailing: {
                    Button(action: {
                        //
                    }) {
                        Image(systemName: "circle.fill")
                    }
                }
                
                Spacer().frame(height: 16)
                
                detailview
                    .frame(height: 150)
                
                subGoalview
            }
            
            
            
        }
        .navigationBarHidden(true)
    }
    
    var detailview: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("\(title)")
                    .font(.mq(.bold, size: 18))
                
                Text("UI/UX 공부를 위해 제일 먼저 피그마부터 정복해보자!")
                    .font(.mq(.medium, size: 14))
                    .foregroundColor(.mqGrayStatusText)
                    .multilineTextAlignment(.leading)
                    .lineSpacing(5)
                    .frame(width: 202)
                    .padding(.bottom, 16)
                
                HStack {
                    RoundedRectangle(cornerRadius: 2)
                        .fill(Color(hex: "#D6C3F1"))
                        .frame(width: 16, height: 16)
                    
                    Text("7")
                        .font(.mq(.medium, size: 14))
                        .foregroundColor(.mqGrayStatusText)
                }
            }
            
            CircleBar(progress: 25)
                .frame(width: 96, height: 96)
        }
        .padding(.bottom, 16)
    }
    
    var subGoalview: some View {
        ZStack {
            Color(hex: "#F5F2F8").ignoresSafeArea()
            
            VStack {
                Text("서브 목표들이 여기 들어가요.")
                    .font(.mq(.medium, size: 14))
                    .foregroundColor(.gray)
            }
        }
    }
}

#Preview {
    GoalDetailView(title: "Figma 정복하기")
}

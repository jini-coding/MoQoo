//
//  ContentMainView.swift
//  MoQoo
//
//  Created by Jini on 4/16/25.
//

import SwiftUI

struct ContentMainView: View {
    @EnvironmentObject var dataManager: DataManager
    
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Figma 정복하기")
                        .font(.mq(.semibold, size: 20))
                        .padding(.top, 8)
                        //.padding(.bottom, 18)
                        //.background(.gray)
                        //.frame(width: 206, height: 20)
                    
                    Text("UI/UX 공부를 위해 제일 먼저 피그마부터 정복해보자!")
                        .font(.mq(.semibold, size: 16))
                        .foregroundColor(.mqGrayStatusText)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(5)
                        .frame(width: 206, height: 48, alignment: .leading)
                        .padding(.top, 14)
                        //.background(.blue)
                }
                
                Spacer()
                
                CircleBar(progress: 25)
                    //.background(.yellow)
                    .padding(.top, 18)
                    .offset(x: 0, y: 4)
            }
            .padding(.bottom, 8)
            .padding(.horizontal, 16)
            
            HStack {
                Text("계획했던 목표 마감일이 24일 남았어요!")
                    .font(.mq(.medium, size: 12))
                    .foregroundColor(.mqGrayPlaceholder)
                    .padding(.leading, 18)
                
                Spacer()
                
                Text("22% 완료")
                    .font(.mq(.medium, size: 12))
                    .foregroundColor(.mqGrayStatusText)
                    .padding(.trailing, 10)
            }
            
            Spacer().frame(height: 20)
            
            
            HStack {
                Text("오늘은 무엇을 해볼까요?")
                    .font(.mq(.semibold, size: 20))
                    .padding(.leading, 16)
                
                Spacer()
            }
            
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(dataManager.subGoals) { goal in
                        TodoCell(title: goal.title, status: goal.status, leftDay: goal.priority)
                    }
                }
                .padding(.horizontal, 0)
            }
            .scrollIndicators(.hidden)
            .padding(.top, 6)
            .padding(.horizontal, 16)
            
            
        }
        
    }
}

#Preview {
    MainView()
}

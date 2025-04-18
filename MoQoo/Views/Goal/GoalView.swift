//
//  GoalView.swift
//  MoQoo
//
//  Created by Jini on 4/13/25.
//

import SwiftUI

struct GoalView: View {
    @EnvironmentObject var dataManager: DataManager
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color.mqLightMain.ignoresSafeArea()
                
                VStack {
                    HStack {
                        Text("나의 목표")
                            .font(.mq(.bold, size: 28))
                            .padding(.leading, 22)
                            .offset(x: 0, y: 6)
                        
                        Spacer()
                        
                        NavigationLink(destination: CreateFinalGoalView()) {
                            Image("plusIcon")
                        }
                        .padding(.trailing, 16)
                    }
                    
                    Spacer().frame(height: 10)
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            Text("순서 편집")
                                .font(.mq(.medium, size: 10))
                                .foregroundColor(.mqGrayStatusText)
                        }
                        .frame(width: 49, height: 23)
                        .background(Color.mqGrayStatusBg)
                        .cornerRadius(6)
                        .padding(.trailing, 20)
                    }
                    
                    ScrollView {
                        LazyVStack(spacing: 0) {
                            ForEach(dataManager.finalGoals) { goal in
                                NavigationLink(
                                    destination: GoalDetailView(goalId: goal.id!, title: goal.title, goal: goal)
                                ) {
                                    FinalGoalListCell(
                                        title: goal.title,
                                        detail: goal.resolution,
                                        status: "진행 중", // 상태 로직 생기면 수정
                                        progress: goal.progress
                                    )
                                }
                                .buttonStyle(PlainButtonStyle())
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
    }
    
    func move(from source: IndexSet, to destination: Int) {
        
    }
    
}

#Preview {
    GoalView()
        .environmentObject(DataManager())
}

//
//  GoalView.swift
//  MoQoo
//
//  Created by Jini on 4/13/25.
//

import SwiftUI

struct GoalView: View {
    @EnvironmentObject var dataManager: DataManager
    @EnvironmentObject var goalViewModel: GoalViewModel
    
    var body: some View {
        
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                Color.mqGoalBg.ignoresSafeArea()
                
                VStack {
                    Spacer().frame(height: 10)
                    
                    HStack {
                        Text("나의 목표")
                            .font(.mq(.bold, size: 28))
                            .padding(.leading, 22)
                            .offset(x: 0, y: 6)
                        
                        Spacer()
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
                                        detail: goal.description,
                                        status: 1, // 상태 로직 생기면 수정
                                        progress: goal.progress,
                                        colorHex: goal.colorHex,
                                        targetDate: goal.targetDate
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
                
                NavigationLink(destination: CreateFinalGoalView()) {
                    ZStack {
                        Circle()
                            .fill(Color.mqMain)
                            .frame(width: 58, height: 58)
                        
                        Image("plusIcon_white")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                }
                .padding(.bottom, 10)
                .padding(.trailing, 20)
                
            }
        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        
    }
    
}

#Preview {
    GoalView()
        .environmentObject(DataManager())
        .environmentObject(GoalViewModel())
}

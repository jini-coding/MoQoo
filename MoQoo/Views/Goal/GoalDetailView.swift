//
//  GoalDetailView.swift
//  MoQoo
//
//  Created by Jini on 4/17/25.
//

import SwiftUI

struct GoalDetailView: View {
    var goalId: String
    var title: String
    
    var goal: FinalGoal
    
    @EnvironmentObject var dataManager: DataManager
    @EnvironmentObject var goalViewModel: GoalViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var isShowingCreateSubGoalView = false
    @State private var isShowingCreateFinalGoalView = false
    @State private var isPresentingSubGoalSheet = false
    @State private var navigateToSubGoal = false
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack {
                NavigationBar {
                    Text("\(title)")
                        .font(.mq(.semibold, size: 18))
                } leading: {
                    Button(action: {
                        dismiss()
                    }) {
                        Image("backIcon") }
                } trailing: { //하..... 왜 안되지........
                    HStack {
                        
//                        NavigationLink(destination: CreateFinalGoalView()) {
//                            ZStack {
//                                Circle()
//                                    .fill(Color.mqMain)
//                                    .frame(width: 58, height: 58)
//                                
//                                Image("plusIcon_white")
//                                    .resizable()
//                                    .frame(width: 40, height: 40)
//                            }
//                        }

//                        Button(action: {
//                            print("pressed")
//                        }) {
//                            Image("addIcon")
//                        }
                        Button(action: {
                            isPresentingSubGoalSheet = true
                        }) {
                            Image("addIcon")
                        }
                        .sheet(isPresented: $isPresentingSubGoalSheet) {
                            CreateSubGoalView(finalGoalId: goalId)
                                .presentationDetents([.fraction(0.7)])
                                .presentationDragIndicator(.visible)
                        }
//                        NavigationLink(destination: CreateSubGoalView(finalGoalId: goalId)) {
//                            Image("addIcon")
//                        }
//                        .buttonStyle(PlainButtonStyle())
                        
//                        NavigationLink(destination:
//                                        EditFinalGoalView(goalId: goalId, goalName: goal.title, goalDetail: goal.description, targetDate: goal.targetDate)
//                                       //EditFinalGoalView(goalId: goalId)
//                                       
//                        ) {
//                            Image("menuIcon")
//                        }
                        
                        Button(action: {
                            print("pressed")
                            dataManager.deleteFinalGoal(goalId: goalId)
                        }) {
                            Image("menuIcon")
                        }
                    }
                    
                    
                }
                
                Spacer().frame(height: 16)
                
                detailview
                    .frame(height: 150)
                
                subGoalview
            }
            
            
            
        }
        .navigationBarHidden(true)
        .onAppear {
            dataManager.fetchSubGoals(for: goalId)
        }
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
                    .frame(width: 202, alignment: .leading)
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
            .padding(.leading, 24)
            
            Spacer()
            
            DetailCircleBar(progress: 25)
                .frame(width: 96, height: 96)
                .padding(.trailing, 24)
        }
        .padding(.bottom, 16)
    }
    
    var subGoalview: some View {
        ZStack {
            Color(hex: "#F5F2F8").ignoresSafeArea()
            
            VStack {
                Spacer().frame(height: 30)
                
                ScrollView {
                    LazyVStack(spacing: 0) {
                        let subGoalsForGoal = dataManager.subGoalsDict[goalId] ?? []
                        
                        ForEach(subGoalsForGoal) { goal in
                            NavigationLink(
                                destination: EditSubGoalView(taskId: goal.id!, goalName: goal.title, goalDetail: goal.description, targetDate: goal.targetDate)
                            ) {
                                SubGoalListCell(title: goal.title,
                                                detail: goal.description,
                                                status: goal.status,
                                                leftDay: goal.status)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
//                    LazyVStack(spacing: 0) {
//                        ForEach(dataManager.subGoals) { goal in
//                            NavigationLink(
//                                destination: EditSubGoalView(taskId: goal.id!, goalName: goal.title, goalDetail: goal.description, targetDate: goal.targetDate)
//                            ) {
//                                SubGoalListCell(title: goal.title,
//                                                detail: goal.description,
//                                                status: goal.status,
//                                                leftDay: goal.status)
//                            }
//                            .buttonStyle(PlainButtonStyle())
//                        }
//                    }
//                    .padding(.horizontal, 0)
                }
                .scrollIndicators(.hidden)
                .padding(.top, 6)
            }
            
        }
    }
}

//#Preview {
//    GoalDetailView(goalId: "1", title: "Figma 정복하기")
//}

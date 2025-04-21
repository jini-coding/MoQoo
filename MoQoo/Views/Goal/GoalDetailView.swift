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
    
    @State private var goalDetail: FinalGoal? = nil
    @State private var isShowingCreateSubGoalView = false
    @State private var isShowingCreateFinalGoalView = false
    @State private var isPresentingSubGoalSheet = false
    @State private var navigateToSubGoal = false
    @State private var showMenuModal = false
    @State private var showDeleteModal = false
    @State private var showDeleteCompleteModal = false
    @State private var navigateToEditFinalGoal = false
    
    var body: some View {
        ZStack {
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
                    } trailing: {
                        HStack {
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
                            
                            Button(action: {
                                print("pressed")
                                //dataManager.deleteFinalGoal(goalId: goalId)
                                withAnimation {
                                    showMenuModal.toggle()
                                }
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
                dataManager.fetchGoalDetail(goalId: goalId) { fetchedData in
                    self.goalDetail = fetchedData
                }
            }
            
            if showMenuModal {
                MenuModalView(editButtonTapped: {
                    withAnimation {
                        showMenuModal = false
                    }
                    navigateToEditFinalGoal = true
                }, deleteButtonTapped: {
                    withAnimation {
                        showMenuModal = false
                        showDeleteModal = true
                    }
                })
                    .offset(x: 120, y: -255)
            }//사라질때도 부드럽게...
            
            if showDeleteModal {
                DeleteModalView(title: title,
                                deleteButtonTapped: {
                    withAnimation {
                         showDeleteModal = false
                         showDeleteCompleteModal = true
                     }
                    dataManager.deleteFinalGoal(goalId: goalId)
                },
                                cancelButtonTapped: {
                    showDeleteModal = false
                })
            }
            
            if showDeleteCompleteModal {
                VStack {
                    CompleteDeleteModalView()
                }
            }
        }

        NavigationLink(
            destination: EditFinalGoalView(goalId: goalId, goalName: goal.title, goalDetail: goal.description, goalResolution: goal.resolution, targetDate: goal.targetDate),
            isActive: $navigateToEditFinalGoal
        ) {
            EmptyView()
        }
    }
    
    var detailview: some View {
        Group {
            if let goal = goalDetail {
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("\(goal.title)")
                            .font(.mq(.bold, size: 18))
                        
                        Text("\(goal.description)")
                            .font(.mq(.medium, size: 14))
                            .foregroundColor(.mqGrayStatusText)
                            .multilineTextAlignment(.leading)
                            .lineSpacing(5)
                            .frame(width: 202, alignment: .leading)
                            .padding(.bottom, 16)
                        
                        HStack {
                            RoundedRectangle(cornerRadius: 2)
                                .fill(Color(hex: "#\(goal.colorHex)"))
                                .frame(width: 16, height: 16)
                            
                            Text("\(goal.moment)")
                                .font(.mq(.medium, size: 14))
                                .foregroundColor(.mqGrayStatusText)
                        }
                    }
                    .padding(.leading, 24)
                    
                    Spacer()
                    
                    DetailCircleBar(progress: goal.progress, colorHex: goal.colorHex)
                        .frame(width: 96, height: 96)
                        .padding(.trailing, 24)
                }
                .padding(.bottom, 16)
            }
            else {
                loadingdetailview
            }
        }

    }
    
    var loadingdetailview: some View { //나중에 빈걸로 변경
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("\(goal.title)")
                    .font(.mq(.bold, size: 18))
                
                Text("\(goal.description)")
                    .font(.mq(.medium, size: 14))
                    .foregroundColor(.mqGrayStatusText)
                    .multilineTextAlignment(.leading)
                    .lineSpacing(5)
                    .frame(width: 202, alignment: .leading)
                    .padding(.bottom, 16)
                
                HStack {
                    RoundedRectangle(cornerRadius: 2)
                        .fill(Color(hex: "#\(goal.colorHex)"))
                        .frame(width: 16, height: 16)
                    
                    Text("\(goal.moment)")
                        .font(.mq(.medium, size: 14))
                        .foregroundColor(.mqGrayStatusText)
                }
            }
            .padding(.leading, 24)
            
            Spacer()
            
            DetailCircleBar(progress: goal.progress, colorHex: goal.colorHex)
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

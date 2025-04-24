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
    //@EnvironmentObject var tabBarVisibilityManager: TabBarVisibilityManager
    @Environment(\.dismiss) var dismiss
    
    @State private var selectedTaskId: String? = nil
    @State private var taskTitle: String? = nil
    @State private var taskStatus: Int? = nil
    @State private var goalDetail: FinalGoal? = nil
    @State private var isShowingCreateSubGoalView = false
    @State private var isShowingCreateFinalGoalView = false
    @State private var isPresentingSubGoalSheet = false
    @State private var isPresentingEditTaskView = false
    @State private var navigateToSubGoal = false
    @State private var showMenuModal = false
    @State private var showDeleteModal = false
    @State private var showDeleteCompleteModal = false
    @State private var showTaskDeleteModal = false
    @State private var showTaskDeleteCompleteModel = false
    @State private var showTaskDetailModal = false
    @State private var navigateToEditFinalGoal = false
    
    var body: some View {
        ZStack {
            ZStack {
                Color.white.ignoresSafeArea()
                
                VStack {
                    NavigationBar {
                        Text("목표 상세보기")
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
                            .sheet(isPresented: $isPresentingSubGoalSheet, onDismiss: {
                                dataManager.fetchGoalDetail(goalId: goalId) { fetchedData in
                                    self.goalDetail = fetchedData
                                }
                            }) {
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
            .sheet(isPresented: $isPresentingEditTaskView) {
                if let taskId = selectedTaskId,
                   let subGoal = dataManager.subGoalsDict[goalId]?.first(where: { $0.id == taskId }) {
                    EditSubGoalView(
                        finalGoalId: goalId,
                        taskId: subGoal.id!,
                        goalName: subGoal.title,
                        goalDetail: subGoal.description,
                        targetDate: subGoal.targetDate
                    )
                    .presentationDetents([.fraction(0.7)])
                    .presentationDragIndicator(.visible)
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
                    //.offset(x: 120, y: -255)
            }//사라질때도 부드럽게...
            
            if showDeleteModal {
                DeleteModalView(title: title,
                                cancelButtonTapped: {
                    showDeleteModal = false
                },
                                deleteButtonTapped: {
                    withAnimation {
                         showDeleteModal = false
                         showDeleteCompleteModal = true
                     }
                    dataManager.deleteFinalGoal(goalId: goalId)
                })
            }
            
            if showDeleteCompleteModal {
                VStack {
                    CompleteDeleteModalView()
                }
            }
            
            if showTaskDetailModal {
                VStack {
                    TaskDetailModalView(showTaskDetailModal: $showTaskDetailModal,
                                        selectedStatus: $taskStatus,
                                        goalId: goalId, taskId: selectedTaskId!,
                                        deleteButtonTapped: {
                        withAnimation {
                            showTaskDeleteModal = true
                    }},
                                        editButtonTapped: {
                        withAnimation {
                            showTaskDetailModal = false
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            isPresentingEditTaskView = true
                        }
                        
                    })
                    .onDisappear {
                        dataManager.fetchGoalDetail(goalId: goalId) { fetchedData in
                            self.goalDetail = fetchedData
                        }
                    }
                }
            }
            
            if showTaskDeleteModal {
                VStack {
                    DeleteTaskModalView(title: $taskTitle,
                                        cancelButtonTapped: {
                        showTaskDeleteModal = false
                    },
                                        deleteButtonTapped: {
                        withAnimation {
                            showTaskDeleteModal = false
                            showTaskDeleteCompleteModel = true
                        }
                        dataManager.deleteTask(taskId: selectedTaskId!)
                    })
                    .onDisappear {
                        dataManager.fetchGoalDetail(goalId: goalId) { fetchedData in
                            self.goalDetail = fetchedData
                        }
                    }
                }
            }
            
            if showTaskDeleteCompleteModel {
                VStack {
                    CompleteDeleteTaskModalView(completeButtonTapped: {
                        withAnimation {
                            showTaskDeleteCompleteModel = false
                            showTaskDetailModal = false
                        }
                    })
                    .onDisappear {
                        dataManager.fetchGoalDetail(goalId: goalId) { fetchedData in
                            self.goalDetail = fetchedData
                        }
                    }
                }
            }
        }

        NavigationLink(
            destination: EditFinalGoalView(goalId: goalId, goalName: goal.title, goalDetail: goal.description, goalResolution: goal.resolution, targetDate: goal.targetDate, colorHex: goal.colorHex),
            isActive: $navigateToEditFinalGoal
        ) {
            EmptyView()
        }
//        .background(
//            EmptyView()
//                .onAppear { tabBarVisibilityManager.isVisible = false }
//                .onDisappear { tabBarVisibilityManager.isVisible = true }
//        )
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
                            Button(action: {
                                withAnimation {
                                    self.selectedTaskId = goal.id
                                    self.taskStatus = goal.status
                                    self.taskTitle = goal.title
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.03) {
                                        self.showTaskDetailModal = true
                                    }
                                }
                            }) {
                                SubGoalListCell(title: goal.title,
                                                detail: goal.description,
                                                status: goal.status,
                                                leftDay: goalViewModel.calculateDday(from: goal.targetDate))
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
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

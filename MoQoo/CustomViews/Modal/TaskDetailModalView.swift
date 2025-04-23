//
//  TaskDetailModalView.swift
//  MoQoo
//
//  Created by Jini on 4/21/25.
//

import SwiftUI

struct TaskDetailModalView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @EnvironmentObject var dataManager: DataManager
    
    @State private var taskDetail: SubGoal? = nil
    @Binding var showTaskDetailModal: Bool
    @Binding var selectedStatus: Int?
    
    var taskId: String
    
    var goalStatus: GoalStatus {
        GoalStatus(rawValue: selectedStatus!) ?? .notStarted
    }
    var deleteButtonTapped: () -> Void
    var editButtonTapped: () -> Void
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation {
                        showTaskDetailModal = false
                    }
                }
            
            ZStack {
                if let task = taskDetail {
                    ZStack {
                        Color.white.ignoresSafeArea()
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Text(task.title)
                                    .font(.mq(.semibold, size: 18))
                                    .foregroundColor(.black)
                                    .padding(.bottom, 6)
                                    .frame(width: 230, alignment: .leading)
                                
                                Spacer()
                                
                                HStack(spacing: 16) {
                                    Button(action: {
                                        deleteButtonTapped()
                                    }) {
                                        Image("trashIcon_bold")
                                            .resizable()
                                            .frame(width: 26, height: 26)
                                    }
                                    
                                    Button(action: {
                                        editButtonTapped()
                                    }) {
                                        Image("editIcon_bold")
                                            .resizable()
                                            .frame(width: 26, height: 26)
                                    }
                                }
                                .offset(y: -5)

                                //.padding(.trailing, 24)
                            }

                            Text("목표일 |  \(formatDateToString(task.targetDate))")
                                .font(.mq(.medium, size: 14))
                                .foregroundColor(Color(hex: "C5C5C5"))
                                .padding(.bottom, 10)

                            Text(task.description)
                                .font(.mq(.medium, size: 14))
                                .foregroundColor(.mqGrayStatusText)
                                .lineSpacing(4)
                                .frame(width: 230, height: 42, alignment: .leading)
                            
                            Spacer().frame(height: 20)
                            
                            HStack(spacing: 14) {
                                ForEach([GoalStatus.notStarted, .inProgress, .completed], id: \.rawValue) { status in
                                     Button(action: {
                                         selectedStatus = status.rawValue
                                         dataManager.updateStatus(taskId: taskId, status: selectedStatus!)
                                     }) {
                                         Text(status.label)
                                             .font(.mq(.semibold, size: 14))
                                             .foregroundColor(status.textColor)
                                             .frame(width: 93, height: 35)
                                             .background(status.bgColor)
                                             .cornerRadius(12)
                                             .overlay(
                                                 RoundedRectangle(cornerRadius: 12)
                                                     .stroke(
                                                         (selectedStatus ?? task.status) == status.rawValue ? status.textColor : Color.clear,
                                                         lineWidth: 2
                                                     )
                                             )
                                     }
                                 }
                            }
                            
                            //Spacer().frame(height: 32)
                        }
                        .frame(alignment: .leading)
                        .padding(.horizontal, 24)
                        
                    }

                }
            }
            .frame(height: 230)
            .cornerRadius(25)
            .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 0)
            .padding(.horizontal, 16)
            .onAppear {
                dataManager.fetchTaskDetail(taskId: taskId) { fetchedData in
                    self.taskDetail = fetchedData
                }
            }
        }

    }
    
    func formatDateToString(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy년 M월 d일"
        return formatter.string(from: date)
    }
}

//#Preview {
//    TaskDetailModalView(showTaskDetailModal: false, taskId: "")
//}

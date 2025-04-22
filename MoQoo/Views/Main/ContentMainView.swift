//
//  ContentMainView.swift
//  MoQoo
//
//  Created by Jini on 4/16/25.
//

import SwiftUI

struct ContentMainView: View {
    @EnvironmentObject var dataManager: DataManager
    @EnvironmentObject var goalViewModel: GoalViewModel
    
    let goalId: String
    
    var body: some View {
        let finalGoal = dataManager.finalGoals.first { $0.id == goalId }
        
        VStack {
            if let goal = finalGoal {
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(goal.title)
                            .font(.mq(.semibold, size: 20))
                            .padding(.top, 8)
                        //.padding(.bottom, 18)
                        //.background(.gray)
                        //.frame(width: 206, height: 20)
                        
                        Text(goal.description)
                            .font(.mq(.semibold, size: 16))
                            .foregroundColor(.mqGrayStatusText)
                            .multilineTextAlignment(.leading)
                            .lineSpacing(5)
                            .frame(width: 206, height: 48, alignment: .leading)
                            .padding(.top, 14)
                        //.background(.blue)
                    }
                    
                    Spacer()
                    
                    CircleBar(progress: 25, colorHex: "#\(goal.colorHex)")
                    //.background(.yellow)
                        .padding(.top, 18)
                        .offset(x: 0, y: 4)
                }
                .padding(.bottom, 8)
                .padding(.horizontal, 16)
                
                HStack {
                    Text("\(goalViewModel.calculateLeftDay(from: goal.targetDate))")
                        .font(.mq(.medium, size: 12))
                        .foregroundColor(.mqGrayPlaceholder)
                        .padding(.leading, 18)
                    
                    Spacer()
                    
                    Text("\(goal.progress)% 완료")
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
                        let subGoalsForGoal = dataManager.subGoalsDict[goalId] ?? []
                        
                        ForEach(subGoalsForGoal) { goal in
                            TodoCell(title: goal.title, status: goal.status, targetDate: goal.targetDate)
                        }
                    }
                    .padding(.horizontal, 0)
                }
                .scrollIndicators(.hidden)
                .padding(.top, 6)
                .padding(.horizontal, 16)
            }
            else {
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("")
                            .font(.mq(.semibold, size: 20))
                            .padding(.top, 8)
                        //.padding(.bottom, 18)
                        //.background(.gray)
                        //.frame(width: 206, height: 20)
                        
                        Text("")
                            .font(.mq(.semibold, size: 16))
                            .foregroundColor(.mqGrayStatusText)
                            .multilineTextAlignment(.leading)
                            .lineSpacing(5)
                            .frame(width: 206, height: 48, alignment: .leading)
                            .padding(.top, 14)
                        //.background(.blue)
                    }
                    
                    Spacer()
                    
                    CircleBar(progress: 25, colorHex: "#BA98EA")
                    //.background(.yellow)
                        .padding(.top, 18)
                        .offset(x: 0, y: 4)
                }
                .padding(.bottom, 8)
                .padding(.horizontal, 16)
                
                HStack {
                    Text("\(goalViewModel.calculateLeftDay(from: Date()))")//임시
                        .font(.mq(.medium, size: 12))
                        .foregroundColor(.mqGrayPlaceholder)
                        .padding(.leading, 18)
                    
                    Spacer()
                    
                    Text("0% 완료")
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
                        let subGoalsForGoal = dataManager.subGoalsDict[goalId] ?? []
                        
                        ForEach(subGoalsForGoal) { goal in
                            TodoCell(title: goal.title, status: goal.status, targetDate: goal.targetDate)
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

struct ProgressMainView: View {
    
    var body: some View {
        VStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .mqMain))
                .scaleEffect(2.0)
            
            Spacer().frame(height: 30)
            
            Text("로딩중")
                .font(.mq(.semibold, size: 20))
        }

        
    }
//    @EnvironmentObject var dataManager: DataManager
//    @EnvironmentObject var goalViewModel: GoalViewModel
//    
//    let goalId: String
//    
//    var body: some View {
//        HStack {
//            VStack(alignment: .leading, spacing: 0) {
//                Text("")
//                    .font(.mq(.semibold, size: 20))
//                    .padding(.top, 8)
//                //.padding(.bottom, 18)
//                //.background(.gray)
//                //.frame(width: 206, height: 20)
//                
//                Text("")
//                    .font(.mq(.semibold, size: 16))
//                    .foregroundColor(.mqGrayStatusText)
//                    .multilineTextAlignment(.leading)
//                    .lineSpacing(5)
//                    .frame(width: 206, height: 48, alignment: .leading)
//                    .padding(.top, 14)
//                //.background(.blue)
//            }
//            
//            Spacer()
//            
//            CircleBar(progress: 25, colorHex: "#BA98EA")
//            //.background(.yellow)
//                .padding(.top, 18)
//                .offset(x: 0, y: 4)
//        }
//        .padding(.bottom, 8)
//        .padding(.horizontal, 16)
//        
//        HStack {
//            Text("\(goalViewModel.calculateLeftDay(from: Date()))")//임시
//                .font(.mq(.medium, size: 12))
//                .foregroundColor(.mqGrayPlaceholder)
//                .padding(.leading, 18)
//            
//            Spacer()
//            
//            Text("0% 완료")
//                .font(.mq(.medium, size: 12))
//                .foregroundColor(.mqGrayStatusText)
//                .padding(.trailing, 10)
//        }
//        
//        Spacer().frame(height: 20)
//        
//        
//        HStack {
//            Text("오늘은 무엇을 해볼까요?")
//                .font(.mq(.semibold, size: 20))
//                .padding(.leading, 16)
//            
//            Spacer()
//        }
//        
//        ScrollView {
//            LazyVStack(spacing: 0) {
//                let subGoalsForGoal = dataManager.subGoalsDict[goalId] ?? []
//                
//                ForEach(subGoalsForGoal) { goal in
//                    TodoCell(title: goal.title, status: goal.status, targetDate: goal.targetDate)
//                }
//            }
//            .padding(.horizontal, 0)
//        }
//        .scrollIndicators(.hidden)
//        .padding(.top, 6)
//        .padding(.horizontal, 16)
//    }
}


#Preview {
    MainView()
        .environmentObject(DataManager())
}

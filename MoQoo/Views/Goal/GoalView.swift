//
//  GoalView.swift
//  MoQoo
//
//  Created by Jini on 4/13/25.
//

import SwiftUI

struct GoalView: View {
    
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
                            ForEach(0..<1, id: \.self) { _ in
                                FinalGoalListCell(title: "Figma 정복하기", detail: "UI/UX 공부를 위해서...", status: "진행 중", progress: 25)
                                FinalGoalListCell(title: "Swift 정복하기", detail: "iOS 공부를 위해서...", status: "진행 중", progress: 79)
                                FinalGoalListCell(title: "JLPT N3 따기", detail: "일본어도 배우고 싶어!", status: "시작 전", progress: 0)
                                FinalGoalListCell(title: "Figma 정복하기", detail: "UI/UX 공부를 위해서...", status: "진행 중", progress: 25)
                            }
                            .onMove(perform: move)
                        }
                        .padding(.horizontal, 0)
                    }
                    .scrollIndicators(.hidden)
                    .padding(.top, 6)
                    .padding(.horizontal, 16)
//                    List {
//                        ForEach(0..<1, id: \.self) { _ in
//                            Section {
//                                FinalGoalListCell(title: "Figma 정복하기", detail: "UI/UX 공부를 위해서...", status: "진행 중", progress: 25)
//                            }
//                            Section {
//                                FinalGoalListCell(title: "Swift 정복하기", detail: "iOS 공부를 위해서...", status: "진행 중", progress: 79)
//                            }
//                            Section {
//                                FinalGoalListCell(title: "JLPT N3 따기", detail: "일본어도 배우고 싶어!", status: "시작 전", progress: 0)
//                            }
//                            Section {
//                                FinalGoalListCell(title: "Figma 정복하기", detail: "UI/UX 공부를 위해서...", status: "진행 중", progress: 25)
//                            }
//
//                        }
//                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
//                        .listRowSeparator(.hidden)
//                    }
//                    .scrollContentBackground(.hidden)
//                    //.environment(\.editMode, .constant(self.df))
//                    .padding(.horizontal, 0)
//                    .padding(.top, 6)
//                    //.frame(width: 329, height: 368)
                    
                }
                
            }
        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        
    }
    
}

#Preview {
    GoalView()
}

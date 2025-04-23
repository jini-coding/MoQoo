//
//  MainView.swift
//  MoQoo
//
//  Created by Jini on 4/13/25.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var selectedGoalId: String?
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.mqMain.ignoresSafeArea()
                
                VStack {
                    HStack {
                        Text("오늘도 목표를 향해\n한걸음 더 다가가볼까요?")
                            .font(.mq(.semibold, size: 24))
                            .foregroundColor(.white)
                            .tracking(0.5)
                            .lineSpacing(2)
                        
                        Spacer()
                    }
                    .padding(.horizontal, 22)
                    .padding(.top, 23)
                    .padding(.bottom, 22)
                    
                    
                    ZStack {

                        RoundedRectangle(cornerRadius: 12)
                            .fill(.white)
                            .padding(.horizontal, 16)
                            .frame(height: 92)
                            .padding(.bottom, 12)
                        
                        MainDashboardView(selectedGoalId: $selectedGoalId)
                            .offset(x: 0, y: -5)
                    }
                    
                    ZStack {
//                        Triangle()
//                            .offset(x: -80, y: -235) //위치 나중에 원 기준으로....
                        
                        RoundedCornerShape(radius: 8, corners: [.topLeft, .topRight])
                            .fill(.white)
                            .ignoresSafeArea()
                        
                        if let selectedGoalId {
                            ContentMainView(goalId: selectedGoalId)
                        } else {
                           // EmptyMainView()
                            ProgressMainView()
                        }
                    }
                    
                    
                }
                
                
            }
        }
        .onAppear {
            if selectedGoalId == nil,
               let firstGoal = dataManager.finalGoals.first {
                selectedGoalId = firstGoal.id
            }
        }
        .onReceive(dataManager.$finalGoals) { goals in
            if selectedGoalId == nil, let first = goals.first {
                selectedGoalId = first.id
            }
        }
    }
}

struct EmptyMainView: View {
    
    var body: some View {
        VStack {
            
            Spacer()
           
            Text("아직 생성된 목표가 없어요")
                .font(.mq(.semibold, size: 20))
                .foregroundColor(.black)
            
            Spacer().frame(height: 18)
            
            Button(action: {
                
            }) {
                Text("목표 생성하러 가기")
                    .font(.mq(.semibold, size: 18))
                    .foregroundColor(.white)
                    .frame(height: 54)
                    .padding(.horizontal, 54)
                    
            }
            .background(Color.mqMain)
            .cornerRadius(10)
            
            
            Spacer()
            
        }
        
    }
}

struct RoundedCornerShape: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}


#Preview {
    MainView()
}

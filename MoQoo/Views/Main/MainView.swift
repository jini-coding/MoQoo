//
//  MainView.swift
//  MoQoo
//
//  Created by Jini on 4/13/25.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.mqMain.ignoresSafeArea()
                
                VStack {
                    HStack {
                        Text("오늘도 목표를 향해\n한발짝 더 다가가볼까요?")
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
                        
                        MainDashboardView()
                            .offset(x: 0, y: -5)
                    }
                    
                    ZStack {
                        Triangle()
                            .offset(x: -80, y: -272) //위치 나중에 원 기준으로....
                        
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.white)
                            .ignoresSafeArea()
                        
                        // if
                        ContentMainView()
                        //EmptyMainView()
                    }
                    
                    
                }
                
                
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



#Preview {
    MainView()
}

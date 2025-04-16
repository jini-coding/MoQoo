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
                            //자간 -2%
                        
                        Spacer()
                    }
                    .padding(.horizontal, 22)
                    .padding(.top, 23)
                    .padding(.bottom, 22)
                    
                    
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.white)
                        .padding(.horizontal, 16)
                        .frame(height: 92)
                        .padding(.bottom, 12)
                    
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.white)
                        .ignoresSafeArea()
                    
                    
                }
                
                
            }
        }
    }
}

#Preview {
    MainView()
}

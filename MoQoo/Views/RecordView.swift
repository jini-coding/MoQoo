//
//  RecordView.swift
//  MoQoo
//
//  Created by Jini on 4/13/25.
//

import SwiftUI

struct RecordView: View {
    
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
                        
                        Button(action: {
                            
                        }) {
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
                            ForEach(0..<6, id: \.self) { _ in
                                FinalGoalListCell()
                            }
                        }
                        .padding(.horizontal, 0)
                    }
                    //.frame(width: 329, height: 368)
                    .scrollIndicators(.hidden)
                    .padding(.top, 6)
                    .padding(.horizontal, 16)
                }
                
            }
        }
    }
}

#Preview {
    RecordView()
}

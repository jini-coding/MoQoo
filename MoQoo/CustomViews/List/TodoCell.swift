//
//  TodoCell.swift
//  MoQoo
//
//  Created by Jini on 4/16/25.
//

import SwiftUI

struct TodoCell: View {
    var title: String = "오토 레이아웃 이해하기"
    var status: String = "진행 중" //012로할까...
    var progress: Int = 25
    //var endDate: String = ""
    
    var body: some View {
        ZStack {
            Color.mqLightMain.ignoresSafeArea()
            
            VStack {
                HStack {
                    Text("\(title)")
                        .font(.mq(.medium, size: 16))
                        .padding(.leading, 22)
                    
                    Spacer()
                    
                    Text("D - 9")
                        .font(.mq(.bold, size: 14))
                        .foregroundColor(Color(hex: "#F54646"))
                        .padding(.trailing, 10)
                    
                    Text("\(status)")
                        .font(.mq(.medium, size: 12))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 5)
                        .background(Color.mqMintBg)
                        .foregroundColor(Color.mqMintText)
                        .cornerRadius(6)
                        .padding(.trailing, 12)
                    
                }
                
            }
            
        }
        .frame(height: 64)
        .cornerRadius(10)
        .padding(.bottom, 12)
        
    }
}

#Preview {
    MainView()
}


//
//  FinalGoalListCell.swift
//  MoQoo
//
//  Created by Jini on 4/16/25.
//

import SwiftUI

struct FinalGoalListCell: View {
    var title: String
    var detail: String
    var status: String
    var progress: Int
    //var endDate: String = ""
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack {
                HStack {
                    Circle()
                        .frame(width: 16, height: 16)
                        .foregroundColor(.mqGrayPlaceholder)
                        .padding(.leading, 24)
                    
                    Text("\(title)")
                        .font(.mq(.medium, size: 16))
                        .padding(.leading, 4)
                    
                    Spacer()
                    
                    Text("\(status)")
                        .font(.mq(.medium, size: 12))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 5)
                        .background(Color.mqMintBg)
                        .foregroundColor(Color.mqMintText)
                        .cornerRadius(6)
                        .padding(.trailing, 25)
                        .offset(x: 0, y: -2)
                }
                
                Spacer().frame(height: 8)
                
                HStack {
                    Text("\(detail)")
                        .font(.mq(.medium, size: 14))
                        .foregroundColor(.mqGrayStatusText)
                        .padding(.leading, 24)
                    
                    Spacer()
                }
                
                Spacer().frame(height: 12)
                
                HStack(spacing: 19) {
                    //바그래프
                    StickBar(progress: progress)
                        .frame(width: 262, height: 8)
                        .padding(.leading, 26)
                    
                    //퍼센트
                    Text("\(progress)%")
                        .font(.mq(.medium, size: 14))
                        .foregroundColor(.mqMintText)
                        .frame(width: 30)
                        .offset(x: 0, y: -3)
                        .padding(.trailing, 22)
                }
            }
            
        }
        .frame(height: 111)
        .cornerRadius(12)
        .padding(.bottom, 12)
        .padding(.horizontal, 16)
    }
}

#Preview {
    RecordView()
}

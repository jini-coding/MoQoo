//
//  CompleteModalView.swift
//  MoQoo
//
//  Created by Jini on 4/20/25.
//

import SwiftUI

struct CompleteModalView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        completeEditFinalGoalView
    }
    
    var completeCreatFinalGoalView: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack {
                HStack {
                    ZStack {
                        Circle()
                            .frame(width: 24, height: 24)
                            .foregroundColor(Color(hex: "#8A8A8A"))
                            .padding(.leading, 24)
                        
                        Circle()
                            .frame(width: 7, height: 7)
                            .foregroundColor(.white)
                            .padding(.leading, 24)
                            .offset(x: 4, y: 4)
                    }
                    
                    Spacer().frame(width: 8)
                    
                    Text("Figma 정복하기")
                        .font(.mq(.bold, size: 24))
                        .foregroundColor(.black)
                }
                //가운데정렬
                
                Spacer().frame(height: 18)
                
                Text("목표가 만들어졌어요!")
                    .font(.mq(.bold, size: 20))
                    .foregroundColor(.black)
                
                Spacer().frame(height: 20)
                
                Text("이제 한 걸음씩 함께 나아가봐요")
                    .font(.mq(.medium, size: 14))
                    .foregroundColor(.black)
                
                Spacer().frame(height: 40)
                
                ModalBottomButton(
                    label: "확인",
                    action: {
                        
                    }
                )
                
                
            }
            
        }
        .frame(height: 330)
        .cornerRadius(25)
        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 0)
        .padding(.horizontal, 35)
    }
    
    var completeEditFinalGoalView: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack {
                Text("목표가 수정되었습니다")
                    .font(.mq(.semibold, size: 20))
                    .foregroundColor(.black)
                
                Spacer().frame(height: 30)
                
                ModalBottomButton(
                    label: "확인",
                    action: {
                        
                        dismiss() 
                    }
                )
                
                
            }
            
        }
        .frame(height: 150)
        .cornerRadius(25)
        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 0)
        .padding(.horizontal, 35)
    }
    
    
    var completeDeleteFinalGoalView: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack {
                Text("목표가 삭제되었습니다")
                    .font(.mq(.semibold, size: 20))
                    .foregroundColor(.black)
                
                Spacer().frame(height: 30)
                
                ModalBottomButton(
                    label: "확인",
                    action: {
                        
                        dismiss()
                    }
                )
                
            }
            
        }
        .frame(height: 150)
        .cornerRadius(25)
        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 0)
        .padding(.horizontal, 35)
    }
}

//#Preview {
//    CompleteModalView(isShowing: true)
//}

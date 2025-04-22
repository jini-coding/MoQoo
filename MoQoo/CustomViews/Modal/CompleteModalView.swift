//
//  CompleteModalView.swift
//  MoQoo
//
//  Created by Jini on 4/20/25.
//

import SwiftUI

struct CompleteModalView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var task: Int
    var title: String = ""
    var colorHex: String = "FFEE00"
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .ignoresSafeArea()
            
            switch task {
            case 1: completeCreatFinalGoalView
            case 3: completeEditFinalGoalView
            default: completeEditFinalGoalView //임시
                
            }
        }
        
        
        
    }
    
    var completeCreatFinalGoalView: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack {
                Spacer().frame(height: 20)
                
                HStack {
                    ZStack {
                        Circle()
                            .frame(width: 18, height: 18)
                            .foregroundColor(Color(hex: "#\(colorHex)"))
                        
                        Circle()
                            .frame(width: 5.25, height: 5.25)
                            .foregroundColor(.white)
                            .offset(x: 2.5, y: 2.5)
                    }
                    
                    Spacer().frame(width: 8)
                    
                    Text("\(title)")
                        .font(.mq(.bold, size: 20))
                        .foregroundColor(.black)
                }
                .padding(.bottom, 2)
                //가운데정렬
                
                Text("목표가 만들어졌어요")
                    .font(.mq(.semibold, size: 20))
                    .foregroundColor(.black)
                
                Spacer().frame(height: 20)
                
                Text("이제 한 걸음씩 함께 나아가봐요")
                    .font(.mq(.medium, size: 16))
                    .foregroundColor(.black)
                    .padding(.horizontal, 20) //여기 왜 이런걸까..?
                    .multilineTextAlignment(.leading)
                
                Spacer().frame(height: 20)
                
                ModalBottomButton(
                    label: "확인",
                    action: {
                        dismiss()
                    }
                )
                
                
            }
            
        }
        .frame(height: 210)
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

#Preview {
    CompleteModalView(task: 1)
}

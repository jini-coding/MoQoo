//
//  GoalDetailView.swift
//  MoQoo
//
//  Created by Jini on 4/17/25.
//

import SwiftUI

struct GoalDetailView: View {
    var title: String
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Color.gray.ignoresSafeArea()
            
            NavigationBar {
                Text("목표 상세 보기")
                    .font(.mq(.semibold, size: 18))
            } leading: {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left") }
            }
            
            Spacer()
            
            
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    GoalDetailView(title: "Figma 정복하기")
}

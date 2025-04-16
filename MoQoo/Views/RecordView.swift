//
//  RecordView.swift
//  MoQoo
//
//  Created by Jini on 4/13/25.
//

import SwiftUI

struct RecordView: View {
    
    var body: some View {
        VStack {
            Color.mqLightMain.ignoresSafeArea()
            
            HStack {
                Text("나의 목표")
                    .font(.mq(.bold, size: 24))
                    .padding(.leading, 22)
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Image("plusIcon")
                }
                .padding(.trailing, 16)
            }
            
            Spacer().frame(height: 100)
        }
    }
}

#Preview {
    RecordView()
}

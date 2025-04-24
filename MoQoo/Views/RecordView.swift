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
                Color.mqGoalBg.ignoresSafeArea()

                VStack {
                    Spacer().frame(height: 23)
                    
                    Image("calendar")
                        .resizable()
                        .frame(height: 590)
                        .padding(.horizontal, 18)
                        .offset(x: 1, y: -8.5)
                    
                    Spacer()
                }
            }
            
        }

        
    }
}

#Preview {
    RecordView()
}

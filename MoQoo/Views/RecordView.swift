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
                        .frame(height: 574)
                        .padding(.horizontal, 18)
                    
                    Spacer()
                }
            }
            
        }

        
    }
}

#Preview {
    RecordView()
}

//
//  TabBarView.swift
//  MoQoo
//
//  Created by Jini on 4/13/25.
//

import SwiftUI

enum Tab {
    case home
    case goal
    case record
    case mypage
}

struct TabBarView: View {
    //@StateObject var tabBarVisibilityManager = TabBarVisibilityManager()
    
    @State var selectedTab: Tab = .home
    
    var body: some View {
        VStack {
            switch selectedTab {
            case .home:
                MainView()
                
            case .goal:
                GoalView()
                
            case .record:
                RecordView()
                
            case .mypage:
                MypageView()
            }
            CustomTabView(selectedTab: $selectedTab)
//            if tabBarVisibilityManager.isVisible {
//                CustomTabView(selectedTab: $selectedTab)
//            }
        }
        //.environmentObject(tabBarVisibilityManager)
    }
    
    
}

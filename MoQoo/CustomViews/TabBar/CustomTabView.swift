//
//  CustomTabView.swift
//  MoQoo
//
//  Created by Jini on 4/13/25.
//

import SwiftUI

struct CustomTabView: View {
    @Binding var selectedTab: Tab

    var body: some View {
        VStack {
            HStack {
                tabItem(image: "house", title: "홈", tab: .home)
                Spacer()
                tabItem(image: "checklist", title: "목표", tab: .goal)
                Spacer()
                tabItem(image: "doc.text", title: "기록", tab: .record)
                Spacer()
                tabItem(image: "person", title: "정보", tab: .mypage)
            }
            .padding(.horizontal, 50)
            .padding(.top, 10)
            .padding(.bottom, 10)
            .background(Color.white)
            .shadow(color: .gray.opacity(0.2), radius: 8, y: -2)
        }
        .edgesIgnoringSafeArea(.bottom)
    }

    @ViewBuilder
    private func tabItem(image: String, title: String, tab: Tab) -> some View {
        Button {
            selectedTab = tab
        } label: {
            VStack(spacing: 6) {
                Image(systemName: image)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(selectedTab == tab ? .mqMain : .mqGray)
                Text(title)
                    .font(.system(size: 12))
                    .foregroundColor(selectedTab == tab ? .mqMain : .mqGray)
            }
        }
    }
}

#Preview {
    TabBarView()
        .environmentObject(DataManager())
        .environmentObject(GoalViewModel())
}

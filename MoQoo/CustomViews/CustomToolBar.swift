//
//  CustomToolBar.swift
//  MoQoo
//
//  Created by Jini on 4/16/25.
//

import SwiftUI

struct NavigationBar<Title: View, Leading: View, Trailing: View>: View {
    
    // MARK: - Init
    
    init(@ViewBuilder title: () -> Title, leading: () -> Leading = { EmptyView() }, trailing: () -> Trailing = { EmptyView() }) {
        self.title = title()
        self.leading = leading()
        self.trailing = trailing()
    }
    
    // MARK: - Properties
    
    var title: Title
    var leading: Leading
    var trailing: Trailing
    
    // MARK: - Properties (View)
    
    var body: some View {
        ZStack {
            Color.white
            HStack(spacing: 0) {
                leading.padding()
                Spacer()
                trailing.padding()
            }
            HStack {
                title.padding()
            }
        }
        .foregroundStyle(Color.black)
        .frame(height: 50)
    }
    
}
//struct CustomToolBar: View {
//    var leadingAction: () -> Void
//    var trailingAction: () -> Void
//    
//    var body: some View {
//        HStack {
//            Button(action: leadingAction) {
//                Image(systemName: "chevron.left")
//                    .foregroundColor(.black)  // 원하는 색상
//            }
//            Spacer()
//        }
//        .padding()
//        .background(Color.white)  // 배경색 설정
//        .frame(maxWidth: .infinity)
//    }
//}
//
//#Preview {
//    CustomToolBar(leadingAction: {}, trailingAction: {})
//}

//
//  GoalViewModel.swift
//  MoQoo
//
//  Created by Jini on 4/18/25.
//

import SwiftUI

class GoalViewModel: ObservableObject {
    
    
    
    
    func countCompleted() { //완료된 테스크 개수 카운트
        
    }
    
    func calculateDday(from targetDate: Date) -> String {
        let calendar = Calendar.current
        var calendarKST = calendar
        calendarKST.timeZone = TimeZone(identifier: "Asia/Seoul")!
        
        // 오늘 한국 오전 12시 기준
        let now = Date()
        let today = calendarKST.startOfDay(for: now)
        let target = calendarKST.startOfDay(for: targetDate)
        
        let components = calendarKST.dateComponents([.day], from: today, to: target)
        guard let dayDiff = components.day else { return "D-Day" }

        if dayDiff > 0 {
            return "D-\(dayDiff)"
        } else if dayDiff == 0 {
            return "D-Day"
        } else {
            return "D+\(-dayDiff)"
        }
    }
    
}

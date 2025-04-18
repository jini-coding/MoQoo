//
//  FinalGoal.swift
//  MoQoo
//
//  Created by Jini on 4/16/25.
//

import Foundation

struct FinalGoal: Identifiable, Codable {
    var id: String
    var title: String
    var description: String
    var resolution: String //다짐
    var progress: Int //진행률
    var moment: Int //모먼트
    var targetDate: Date //목표마감일
    var colorHex: String
    var createdAt: Date
    
    var subGoals: [SubGoal]
}

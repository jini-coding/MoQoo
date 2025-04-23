//
//  FinalGoal.swift
//  MoQoo
//
//  Created by Jini on 4/16/25.
//

import Foundation
import FirebaseFirestore

struct FinalGoal: Identifiable, Codable {
    @DocumentID var id: String?
    var title: String
    var description: String
    var resolution: String //다짐
    var progress: Int //진행률
    var moment: Int //모먼트
    var targetDate: Date //목표마감일
    var colorHex: String
    var createdAt: Date
    
    var subGoals: [SubGoal]
    
    var totalSubGoals: Int
    var completedSubGoals: Int
}

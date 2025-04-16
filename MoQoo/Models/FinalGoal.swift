//
//  FinalGoal.swift
//  MoQoo
//
//  Created by Jini on 4/16/25.
//

import Foundation

struct FinalGoal: Codable {
    var title: String //이름
    var detail: String //상세정보
    var status: String //진행상태
    var progress: Float //진행률
    var endDate: String //목표마감일
    
    //서브골 배열
}

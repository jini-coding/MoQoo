//
//  SubGoal.swift
//  MoQoo
//
//  Created by Jini on 4/16/25.
//

import Foundation

struct SubGoal: Identifiable, Codable {
    var id: String
    var title: String //이름
    var description: String //상세정보
    var status: Int //진행상태
    var startDate: String //시작일
    var endDate: String //목표마감일
    var createdAt: Date
    var priority: Int //우선도
}

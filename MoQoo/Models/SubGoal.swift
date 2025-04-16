//
//  SubGoal.swift
//  MoQoo
//
//  Created by Jini on 4/16/25.
//

import Foundation

struct SubGoal: Codable {
    var title: String //이름
    var detail: String //상세정보
    var status: String //진행상태
    var startDate: String //시작일
    var endDate: String //목표마감일
    var priority: String //우선도
}

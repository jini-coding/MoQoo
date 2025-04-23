//
//  DataManager.swift
//  MoQoo
//
//  Created by Jini on 4/18/25.
//

import SwiftUI
import Firebase

class DataManager: ObservableObject {
    @Published var finalGoals: [FinalGoal] = [] //나중에
    @Published var subGoals: [SubGoal] = []
    @Published var subGoalsDict: [String: [SubGoal]] = [:]
    
    init() {
        fetchGoals()
        fetchTasks()
    }
    
    func fetchGoals() {
        
        let db = Firestore.firestore()
        let ref = db.collection("FinalGoals")
        
        finalGoals.removeAll()
        
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let title = data["title"] as? String ?? ""
                    let description = data["description"] as? String ?? ""
                    let resolution = data["resolution"] as? String ?? ""
                    let progress = data["progress"] as? Int ?? 0
                    let moment = data["moment"] as? Int ?? 0
                    
                    let targetDateTimestamp = data["targetDate"] as? Timestamp
                    let targetDate = targetDateTimestamp?.dateValue() ?? Date()
                    
                    let colorHex = data["colorHex"] as? String ?? ""
                    
                    let createdAtTimestamp = data["createdAt"] as? Timestamp
                    let createdAt = createdAtTimestamp?.dateValue() ?? Date()
                    
                    let totalSubGoals = data["totalSubGoals"] as? Int ?? 0
                    let completedSubGoals = data["completedSubGoals"] as? Int ?? 0
                    
                    let goal = FinalGoal(id: id, title: title, description: description, resolution: resolution, progress: progress, moment: moment, targetDate: targetDate, colorHex: colorHex, createdAt: createdAt, subGoals: [], totalSubGoals: totalSubGoals, completedSubGoals: completedSubGoals)
                    self.finalGoals.append(goal)
                }
            }
        }
    }
    
//    func fetchTasks() {
//        //self.subGoals.removeAll()
//        
//        let db = Firestore.firestore()
//        let ref = db.collection("SubGoals")
//        ref.getDocuments { snapshot, error in
//            guard error == nil else {
//                print(error!.localizedDescription)
//                return
//            }
//            
//            if let snapshot = snapshot {
//                for document in snapshot.documents {
//                    let data = document.data()
//                    
//                    let id = data["id"] as? String ?? ""
//                    let finalGoalId = data["finalGoalId"] as? String ?? ""
//                    let title = data["title"] as? String ?? ""
//                    let description = data["description"] as? String ?? ""
//                    let status = data["status"] as? Int ?? 0
//                    
//                    let targetDateTimestamp = data["targetDate"] as? Timestamp
//                    let targetDate = targetDateTimestamp?.dateValue() ?? Date()
//                    
//                    let createdAtTimestamp = data["createdAt"] as? Timestamp
//                    let createdAt = createdAtTimestamp?.dateValue() ?? Date()
//                    
//                    let priority = data["priority"] as? Int ?? 0
//                    
//                    
//                    let goal = SubGoal(id: id, finalGoalId: finalGoalId, title: title, description: description, status: status, targetDate: targetDate, createdAt: createdAt, priority: priority)
//                    self.subGoals.append(goal)
//                }
//            }
//        }
//    }
    
    func fetchTasks() {
        let db = Firestore.firestore()
        let ref = db.collection("SubGoals")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                var grouped: [String: [SubGoal]] = [:]
                
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let finalGoalId = data["finalGoalId"] as? String ?? ""
                    let title = data["title"] as? String ?? ""
                    let description = data["description"] as? String ?? ""
                    let status = data["status"] as? Int ?? 0
                    let targetDate = (data["targetDate"] as? Timestamp)?.dateValue() ?? Date()
                    let createdAt = (data["createdAt"] as? Timestamp)?.dateValue() ?? Date()
                    let priority = data["priority"] as? Int ?? 0
                    
                    let goal = SubGoal(id: id, finalGoalId: finalGoalId, title: title, description: description, status: status, targetDate: targetDate, createdAt: createdAt, priority: priority)
                    
                    grouped[finalGoalId, default: []].append(goal)
                }
                
                DispatchQueue.main.async {
                    self.subGoalsDict = grouped
                    
                    for (index, goal) in self.finalGoals.enumerated() {
                        if let goalId = goal.id {
                            let relatedSubGoals = grouped[goalId] ?? []
                            let total = relatedSubGoals.count
                            let completed = relatedSubGoals.filter { $0.status == 2 }.count
                            let progress = total > 0 ? Int((Double(completed) / Double(total)) * 100) : 0
                            
                            self.finalGoals[index].subGoals = relatedSubGoals
                            self.finalGoals[index].totalSubGoals = total
                            self.finalGoals[index].completedSubGoals = completed
                            self.finalGoals[index].progress = progress
                        }
                    }
                }
            }
        }
    }
    
    //골에 해당하는 테스크들만 가져오기
    func fetchSubGoals(for goalId: String) {
        subGoals.removeAll()

        let db = Firestore.firestore()
        let ref = db.collection("SubGoals").whereField("finalGoalId", isEqualTo: goalId)
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }

            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()

                    let id = data["id"] as? String ?? ""
                    let finalGoalId = data["finalGoalId"] as? String ?? ""
                    let title = data["title"] as? String ?? ""
                    let description = data["description"] as? String ?? ""
                    let status = data["status"] as? Int ?? 0

                    let targetDateTimestamp = data["targetDate"] as? Timestamp
                    let targetDate = targetDateTimestamp?.dateValue() ?? Date()

                    let createdAtTimestamp = data["createdAt"] as? Timestamp
                    let createdAt = createdAtTimestamp?.dateValue() ?? Date()

                    let priority = data["priority"] as? Int ?? 0

                    let goal = SubGoal(id: id, finalGoalId: finalGoalId, title: title, description: description, status: status, targetDate: targetDate, createdAt: createdAt, priority: priority)
                    self.subGoals.append(goal)
                }
            }
        }
    }
    
    func fetchGoalDetail(goalId: String, completion: @escaping (FinalGoal?) -> Void) {
        let db = Firestore.firestore()
        let ref = db.collection("FinalGoals").document(goalId)
        ref.getDocument { document, error in
            guard error == nil else {
                print(error!.localizedDescription)
                completion(nil)
                return
            }

            if let document = document, document.exists {
                let data = document.data() ?? [:]
                
                let id = data["id"] as? String ?? ""
                let title = data["title"] as? String ?? ""
                let description = data["description"] as? String ?? ""
                let resolution = data["resolution"] as? String ?? ""
                let progress = data["progress"] as? Int ?? 0
                let moment = data["moment"] as? Int ?? 0
                
                let targetDateTimestamp = data["targetDate"] as? Timestamp
                let targetDate = targetDateTimestamp?.dateValue() ?? Date()
                
                let colorHex = data["colorHex"] as? String ?? ""
                
                let createdAtTimestamp = data["createdAt"] as? Timestamp
                let createdAt = createdAtTimestamp?.dateValue() ?? Date()
                
                let totalSubGoals = data["totalSubGoals"] as? Int ?? 0
                let completedSubGoals = data["completedSubGoals"] as? Int ?? 0
                
                let goal = FinalGoal(id: id, title: title, description: description, resolution: resolution, progress: progress, moment: moment, targetDate: targetDate, colorHex: colorHex, createdAt: createdAt, subGoals: [], totalSubGoals: totalSubGoals, completedSubGoals: completedSubGoals)
                
                DispatchQueue.main.async {
                    completion(goal)
                }
            }
        }
    }

    func fetchTaskDetail(taskId: String, completion: @escaping (SubGoal?) -> Void) {
        let db = Firestore.firestore()
        let ref = db.collection("SubGoals").document(taskId)
        ref.getDocument { document, error in
            guard error == nil else {
                print(error!.localizedDescription)
                completion(nil)
                return
            }

            if let document = document, document.exists {
                let data = document.data() ?? [:]
                
                let id = data["id"] as? String ?? ""
                let finalGoalId = data["finalGoalId"] as? String ?? ""
                let title = data["title"] as? String ?? ""
                let description = data["description"] as? String ?? ""
                let status = data["status"] as? Int ?? 0

                let targetDateTimestamp = data["targetDate"] as? Timestamp
                let targetDate = targetDateTimestamp?.dateValue() ?? Date()

                let createdAtTimestamp = data["createdAt"] as? Timestamp
                let createdAt = createdAtTimestamp?.dateValue() ?? Date()

                let priority = data["priority"] as? Int ?? 0
                
                
                let task = SubGoal(id: id, finalGoalId: finalGoalId, title: title, description: description, status: status, targetDate: targetDate, createdAt: createdAt, priority: priority)
                
                DispatchQueue.main.async {
                    completion(task)
                    print(task)
                }
            }
        }
    }

    
    func createFinalGoal(title: String, description: String, targetDate: Date, colorHex: String) {
        let db = Firestore.firestore()
        let ref = db.collection("FinalGoals").document()
        
        let createdAt = Date()
        let newGoal: [String: Any] = [
                "id": ref.documentID,
                "title": title,
                "description": description,
                "resolution": "아아아",
                "progress": 0,
                "moment": 0,
                "targetDate": Timestamp(date: targetDate),
                "colorHex": "#\(colorHex)",
                "createdAt": Timestamp(date: createdAt)
        ]
        
        ref.setData(newGoal) { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("골 생성완료!!")
                DispatchQueue.main.async {
                    self.fetchGoals()
                }
            }
        }
        
    }
    
    func createTask(finalGoalId: String, title: String, description: String, targetDate: Date, priority: Int) {
        let db = Firestore.firestore()
        let ref = db.collection("SubGoals").document()
        
        let createdAt = Date()
        let newTask: [String: Any] = [
                "id": ref.documentID,
                "finalGoalId": finalGoalId,
                "title": title,
                "description": description,
                "status": 0,
                "targetDate": Timestamp(date: targetDate),
                "createdAt": Timestamp(date: createdAt),
                "priority": priority
        ]
        
        ref.setData(newTask) { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("테스크 생성완료!!")
                DispatchQueue.main.async {
                    self.fetchTasks()
                }
            }
        }
        
    }
    
    func editFinalGoal(goalId: String, title: String, description: String, targetDate: Date) {
        let db = Firestore.firestore()
        let ref = db.collection("FinalGoals").document(goalId)
        
        //let createdAt = Date()
        let updatedGoal: [String: Any] = [
                "title": title,
                "description": description,
                "resolution": "아아아아아아아아",
                "progress": 2,
                "targetDate": Timestamp(date: targetDate),
                "colorHex": "#FFCC00"
        ]
        
        ref.setData(updatedGoal, merge: true) { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("골 수정 완료!!")
                DispatchQueue.main.async {
                    self.fetchGoals()
                }
            }
        }
    }
    
    func editTask(taskId: String, title: String, description: String, status: Int, targetDate: Date) {
        let db = Firestore.firestore()
        let ref = db.collection("SubGoals").document(taskId)
        
        let updatedTask: [String: Any] = [
                "title": title,
                "description": description,
                "status": status,
                "targetDate": Timestamp(date: targetDate),
                "priority": 2
        ]
        
        ref.setData(updatedTask, merge: true) { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("테스크 수정 완료!!")
                DispatchQueue.main.async {
                    self.fetchTasks()
                }
            }
        }
    }
    
//    func deleteFinalGoal(goalId: String) {
//        let db = Firestore.firestore()
//        let ref = db.collection("FinalGoals").document(goalId).delete() { error in
//            if let error = error {
//                print(error.localizedDescription)
//            } else {
//                print("골 삭제 완료!!")
//            }
//        }
//
//    }
    func deleteFinalGoal(goalId: String) {
        let db = Firestore.firestore()

        let subGoalRef = db.collection("SubGoals").whereField("finalGoalId", isEqualTo: goalId)
        subGoalRef.getDocuments { snapshot, error in
            if let error = error {
                print("서브골 불러오기 실패: \(error.localizedDescription)")
                return
            }

            let batch = db.batch()
            snapshot?.documents.forEach { document in
                batch.deleteDocument(document.reference)
            }

            let finalGoalRef = db.collection("FinalGoals").document(goalId)
            batch.deleteDocument(finalGoalRef)
            
            batch.commit { error in
                if let error = error {
                    print("삭제 실패: \(error.localizedDescription)")
                } else {
                    print("FinalGoal과 관련된 모든 SubGoal 삭제 완료")
                    
                    DispatchQueue.main.async {
                        self.fetchGoals()
                    }
                }
            }
        }
    }

    
    func deleteTask(taskId: String) {
        let db = Firestore.firestore()
        let ref = db.collection("SubGoals").document(taskId).delete() { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("테스크 삭제 완료!!")
                DispatchQueue.main.async {
                    self.fetchTasks()
                }
            }
        }

    }
    
    func updateStatus(taskId: String, status: Int) {
        let db = Firestore.firestore()
        let ref = db.collection("SubGoals").document(taskId)
        
        let updatedStatus = ["status": status]
        
        ref.setData(updatedStatus, merge: true) { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("상태 업데이트 완료!!")
                DispatchQueue.main.async {
                    self.fetchTasks()
                }
            }
        }
    }
}

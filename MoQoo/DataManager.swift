//
//  DataManager.swift
//  MoQoo
//
//  Created by Jini on 4/18/25.
//

import SwiftUI
import Firebase

class DataManager: ObservableObject {
    @Published var finalGoals: [FinalGoal] = []
    @Published var subGoals: [SubGoal] = []
    
    init() {
        fetchGoals()
        fetchTasks()
    }
    
    func fetchGoals() {
        
        let db = Firestore.firestore()
        let ref = db.collection("FinalGoals")
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
                    let progress = data["progresss"] as? Int ?? 0
                    
                    let targetDateTimestamp = data["targetDate"] as? Timestamp
                    let targetDate = targetDateTimestamp?.dateValue() ?? Date()
                    
                    let colorHex = data["colorHex"] as? String ?? ""
                    
                    let createdAtTimestamp = data["createdAt"] as? Timestamp
                    let createdAt = createdAtTimestamp?.dateValue() ?? Date()
                    
                    
                    let goal = FinalGoal(id: id, title: title, description: description, resolution: resolution, progress: progress, moment: 5, targetDate: targetDate, colorHex: colorHex, createdAt: createdAt, subGoals: [])
                    self.finalGoals.append(goal)
                }
            }
        }
    }
    
    func fetchTasks() {
        
        let db = Firestore.firestore()
        let ref = db.collection("SubGoals")
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
                    let status = data["status"] as? Int ?? 0
                    
                    let targetDateTimestamp = data["targetDate"] as? Timestamp
                    let targetDate = targetDateTimestamp?.dateValue() ?? Date()
                    
                    let createdAtTimestamp = data["createdAt"] as? Timestamp
                    let createdAt = createdAtTimestamp?.dateValue() ?? Date()
                    
                    let priority = data["priority"] as? Int ?? 0
                    
                    
                    let goal = SubGoal(id: id, title: title, description: description, status: status, targetDate: targetDate, createdAt: createdAt, priority: priority)
                    self.subGoals.append(goal)
                }
            }
        }
    }
    
    func fetchGoalDetail(id: String) {


    }


    
    func createFinalGoal(title: String, description: String, targetDate: Date) {
        let db = Firestore.firestore()
        let ref = db.collection("FinalGoals").document()
        
        let createdAt = Date()
        let newGoal: [String: Any] = [
                "id": ref.documentID,
                "title": title,
                "description": description,
                "resolution": "아아아",
                "progress": 0,
                "targetDate": Timestamp(date: targetDate),
                "colorHex": "#FFCC00",
                "createdAt": Timestamp(date: createdAt)
        ]
        
        ref.setData(newGoal) { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("골 생성완료!!")
            }
        }
        
    }
    
    func createTask(title: String, description: String, targetDate: Date, priority: Int) {
        let db = Firestore.firestore()
        let ref = db.collection("SubGoals").document()
        
        let createdAt = Date()
        let newTask: [String: Any] = [
                "id": ref.documentID,
                "title": title,
                "description": description,
                "status": "아아아",
                "targetDate": Timestamp(date: targetDate),
                "createdAt": Timestamp(date: createdAt),
                "priority": priority
        ]
        
        ref.setData(newTask) { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("테스크 생성완료!!")
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
            }
        }
    }
    
    func editTask(taskId: String, title: String, description: String, targetDate: Date) {
        let db = Firestore.firestore()
        let ref = db.collection("SubGoals").document(taskId)
        
        let updatedTask: [String: Any] = [
                "title": title,
                "description": description,
                "status": 0,
                "targetDate": Timestamp(date: targetDate),
                "priority": 2
        ]
        
        ref.setData(updatedTask, merge: true) { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("테스크 수정 완료!!")
            }
        }
    }
    
    func deleteFinalGoal(goalId: String) {
        let db = Firestore.firestore()
        let ref = db.collection("FinalGoals").document(goalId).delete() { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("골 삭제 완료!!")
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
            }
        }

    }
}

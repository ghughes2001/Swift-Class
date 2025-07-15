//
//  model.swift
//  To-Do_List
//
//  Created by Grant David Hughes on 7/14/25.
//

import Foundation

enum Priority: String, CaseIterable, Codable {
    case high
    case medium
    case low
}

struct Task: Identifiable, Codable {
    var id: UUID = UUID()
    var title: String
    var date: Date
    var priority: Priority
    var description: String
    var isComplete: Bool
}

class Model {
    static let share = Model()
    
    private let key = "tasks"
    private let defaultrs = UserDefaults.standard
    private(set) var tasks: [Task] = []
    
    func loadingModel() {
        if let data = defaultrs.data(forKey: key), let dataSaved = try? JSONDecoder().decode([Task].self, from: data) {
                self.tasks = dataSaved
            }
    }
    
    func taskSaved() {
        if let data = try? JSONEncoder().encode(tasks) {
            defaultrs.set(data, forKey: key)
        }
    }
    
    init() {
        loadingModel()
    }
    
    func addTask(_ task: Task) {
        tasks.append(task)
        taskSaved()
    }
    
    func removeTask(_ task: Task) {
        tasks.removeAll() { $0.id == task.id }
        taskSaved()
    }
    
    func updateTask(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id}) {
            tasks[index] = task
            taskSaved()
        }
    }
    
    func taskCompleted(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isComplete.toggle()
            taskSaved()
        }
    }
}

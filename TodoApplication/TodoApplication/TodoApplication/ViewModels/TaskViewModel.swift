//
//  TodoApp
//
//  Daniel Konjarski & Carl Trinidad - Group 59
//  101436648 & 101425882
//

import Foundation
import Combine

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    
    init() {
        loadTasks()
    }
    
    func loadTasks() {
        if let data = UserDefaults.standard.data(forKey: "tasks") {
            if let decoded = try? JSONDecoder().decode([Task].self, from: data) {
                self.tasks = decoded
                return
            }
        }
        self.tasks = []
    }
    
    func saveTasks() {
        if let encoded = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encoded, forKey: "tasks")
        }
    }
    
    func addTask(title: String, description: String, dueDate: Date) {
        let newTask = Task(title: title, description: description, dueDate: dueDate)
        tasks.append(newTask)
        saveTasks()
    }
    
    func updateTask(task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index] = task
            saveTasks()
        }
    }
    
    func toggleTaskCompletion(taskId: UUID) {
        if let index = tasks.firstIndex(where: { $0.id == taskId }) {
            tasks[index].isCompleted.toggle()
            saveTasks()
        }
    }
    
    func deleteTask(taskId: UUID) {
        tasks.removeAll(where: { $0.id == taskId })
        saveTasks()
    }
    
    var incompleteTasks: [Task] {
        tasks.filter { !$0.isCompleted }
    }
    
    var completedTasks: [Task] {
        tasks.filter { $0.isCompleted }
    }
    
    func toggleCompletion(for task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }
}



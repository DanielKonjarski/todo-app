//
//  TodoApp
//
//  Daniel Konjarski & Carl Trinidad - Group 59
//  101436648 & 101425882
//

import Foundation

struct Task: Identifiable, Codable {
    let id: UUID
    var title: String
    var description: String
    var dueDate: Date
    var isCompleted: Bool
    
    init(title: String, description: String, dueDate: Date, isCompleted: Bool = false) {
        self.id = UUID()
        self.title = title
        self.description = description
        self.dueDate = dueDate
        self.isCompleted = isCompleted
    }
}



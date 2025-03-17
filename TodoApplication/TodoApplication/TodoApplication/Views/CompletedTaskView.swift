//
//  TodoApp
//
//  Daniel Konjarski & Carl Trinidad - Group 59
//  101436648 & 101425882
//

import SwiftUI

struct CompletedTaskView: View {
    @EnvironmentObject var taskViewModel: TaskViewModel
    
    var body: some View {
        List {
            ForEach(taskViewModel.completedTasks) { task in
                VStack(alignment: .leading) {
                    Text(task.title)
                        .font(.headline)
                        .strikethrough()
                        .foregroundColor(.white)
                    Text(task.description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("Completed on: \(formatDate(task.dueDate))")
                        .font(.caption)
                        .foregroundColor(.green)
                }
                .padding()
                .background(Color.black)
                .cornerRadius(10)
            }
        }
        .navigationTitle("Completed Tasks")
        .background(Color.black)
        .foregroundColor(.white)
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

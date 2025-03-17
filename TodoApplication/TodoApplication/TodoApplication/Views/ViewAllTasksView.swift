//
//  TodoApp
//
//  Daniel Konjarski & Carl Trinidad - Group 59
//  101436648 & 101425882
//

import SwiftUI

struct ViewAllTasksView: View {
    @EnvironmentObject var taskViewModel: TaskViewModel
    
    var body: some View {
        List {
            ForEach(taskViewModel.tasks) { task in
                NavigationLink(destination: EditTaskView(task: task)) {
                    TaskRow(task: task)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
            }
            .onDelete(perform: deleteTask)
        }
        .navigationTitle("All Tasks")
        .toolbar {
            #if os(iOS)
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
                    .foregroundColor(.white)
            }
            #endif
        }
        .background(Color.black)
        .foregroundColor(.white)
    }
    
    private func deleteTask(at offsets: IndexSet) {
        offsets.forEach { index in
            let task = taskViewModel.tasks[index]
            taskViewModel.deleteTask(taskId: task.id)
        }
    }
}

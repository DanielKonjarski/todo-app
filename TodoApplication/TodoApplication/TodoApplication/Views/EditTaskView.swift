//
//  TodoApp
//
//  Daniel Konjarski & Carl Trinidad - Group 59
//  101436648 & 101425882
//

import SwiftUI

struct EditTaskView: View {
    @EnvironmentObject var taskViewModel: TaskViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State private var editedTask: Task
    
    init(task: Task) {
        _editedTask = State(initialValue: task)
    }
    
    var body: some View {
        Form {
            Section(header: Text("Task Details").foregroundColor(.white)) {
                TextField("Task Title", text: $editedTask.title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .foregroundColor(.white)
                TextField("Task Description", text: $editedTask.description)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .foregroundColor(.white)
                DatePicker("Due Date", selection: $editedTask.dueDate, displayedComponents: .date)
                    .foregroundColor(.white)
                Toggle("Completed", isOn: $editedTask.isCompleted)
                    .foregroundColor(.white)
            }
            
            Section {
                Button(action: updateTask) {
                    Text("Update Task")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
            }
        }
        .navigationTitle("Edit Task")
        .background(Color.black)
        .foregroundColor(.white)
    }
    
    private func updateTask() {
        taskViewModel.updateTask(task: editedTask)
        presentationMode.wrappedValue.dismiss()
    }
}

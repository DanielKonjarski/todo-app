//
//  TodoApp
//
//  Daniel Konjarski & Carl Trinidad - Group 59
//  101436648 & 101425882
//

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var taskViewModel: TaskViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State private var title = ""
    @State private var description = ""
    @State private var dueDate = Date()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Task Details").foregroundColor(.white)) {
                    TextField("Task Title", text: $title)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(.white)
                    TextField("Task Description", text: $description)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(.white)
                    DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                        .foregroundColor(.white)
                }
                
                Section {
                    Button(action: addTask) {
                        Text("Add Task")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    }
                }
            }
            .navigationTitle("Create New Task")
            .background(Color.black)
            .foregroundColor(.white)
            .toolbar {
                #if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .foregroundColor(.white)
                }
                #endif
            }
        }
        .background(Color.black)
    }
    
    private func addTask() {
        taskViewModel.addTask(title: title, description: description, dueDate: dueDate)
        presentationMode.wrappedValue.dismiss()
    }
}

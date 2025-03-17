//
//  TodoApp
//
//  Daniel Konjarski & Carl Trinidad - Group 59
//  101436648 & 101425882
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var taskViewModel: TaskViewModel
    @State private var showingAddTask = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome, \(userViewModel.currentUser?.fullName ?? "User")!")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                
                List {
                    ForEach(taskViewModel.incompleteTasks) { task in
                        TaskRow(task: task)
                    }
                }
                
                HStack {
                    NavigationLink(destination: ViewAllTasksView()) {
                        Text("View All Tasks")
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    }
                    
                    Button(action: { showingAddTask = true }) {
                        Text("Add Task")
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    }
                }
                .padding()
                
                Button(action: userViewModel.logout) {
                    Text("Logout")
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
                .padding(.bottom)
            }
            .background(Color.black)
            .navigationTitle("Dashboard")
            .foregroundColor(.white)
            .toolbar {
                #if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: CompletedTaskView()) {
                        Image(systemName: "checkmark.circle")
                            .foregroundColor(.white)
                    }
                }
                #endif
            }
        }
        .sheet(isPresented: $showingAddTask) {
            AddTaskView()
        }
    }
}

struct TaskRow: View {
    @EnvironmentObject var taskViewModel: TaskViewModel
    let task: Task
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(task.title)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(task.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            Button(action: {
                taskViewModel.toggleTaskCompletion(taskId: task.id)
            }) {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(task.isCompleted ? .green : .gray)
            }
        }
        .padding()
        .background(Color.black)
        .cornerRadius(10)
    }
}

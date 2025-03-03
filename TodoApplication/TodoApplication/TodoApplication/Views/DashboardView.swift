//
//  ContentView.swift
//  TodoApplication
//
//  Created by Daniel Konjarski & Carl Trinidad
//


import SwiftUI

struct DashboardView: View {
    @State private var tasks = [
        Task(title: "Buy Groceries", description: "Milk, Eggs, Bread", collection: "Personal", date: Date()),
        Task(title: "Work Meeting", description: "Discuss project status", collection: "Work", date: Date())
    ]

    var body: some View {
        NavigationView {
            VStack {
                Text("Tasks")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()

                List {
                    ForEach(tasks, id: \.id) { task in
                        NavigationLink(destination: EditTaskView(task: task)) {
                            VStack(alignment: .leading) {
                                Text(task.title)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                Text(task.description)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        .listRowBackground(Color.black.opacity(0.8))
                    }
                    .onDelete { indexSet in
                        tasks.remove(atOffsets: indexSet)
                    }
                }
                .scrollContentBackground(.hidden)
                .background(Color.black)

                NavigationLink(destination: AddTaskView()) {
                    Text("+ Add Task")
                        .font(.title2)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding()
                }
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }
    }
}

struct Task: Identifiable {
    let id = UUID()
    var title: String
    var description: String
    var collection: String
    var date: Date
}

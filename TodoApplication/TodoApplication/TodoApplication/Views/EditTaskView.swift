//
//  ContentView.swift
//  TodoApplication
//
//  Created by Daniel Konjarski & Carl Trinidad
//


struct EditTaskView: View {
    @State var task: Task

    var body: some View {
        VStack {
            Text("Edit Task")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()

            TextField("Task", text: $task.title)
                .padding()
                .background(Color.gray.opacity(0.3))
                .cornerRadius(12)
                .foregroundColor(.white)

            TextField("Description", text: $task.description)
                .padding()
                .background(Color.gray.opacity(0.3))
                .cornerRadius(12)
                .foregroundColor(.white)

            TextField("Collection", text: $task.collection)
                .padding()
                .background(Color.gray.opacity(0.3))
                .cornerRadius(12)
                .foregroundColor(.white)

            DatePicker("Select Date", selection: $task.date, displayedComponents: .date)
                .padding()
                .background(Color.gray.opacity(0.3))
                .cornerRadius(12)
                .foregroundColor(.white)

            Button(action: {
                // Update Task Action
            }) {
                Text("Update Task")
                    .font(.title2)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .padding()
            }
        }
        .padding()
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}
//
//  ContentView.swift
//  TodoApplication
//
//  Created by Daniel Konjarski & Carl Trinidad
//


struct AddTaskView: View {
    private var title = ""
    private var description = ""
    private var collection = ""
    private var date = ""

    var body: some View {
        VStack {
            Text("Add Task")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()

            TextField("Task", text: $title)
                .padding()
                .background(Color.gray.opacity(0.3))
                .cornerRadius(12)
                .foregroundColor(.white)

            TextField("Description", text: $description)
                .padding()
                .background(Color.gray.opacity(0.3))
                .cornerRadius(12)
                .foregroundColor(.white)

            TextField("Collection", text: $collection)
                .padding()
                .background(Color.gray.opacity(0.3))
                .cornerRadius(12)
                .foregroundColor(.white)

            DatePicker("Select Date", selection: $date, displayedComponents: .date)
                .padding()
                .background(Color.gray.opacity(0.3))
                .cornerRadius(12)
                .foregroundColor(.white)

            Button(action: {
                // Save Task Action
            }) {
                Text("Save Task")
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

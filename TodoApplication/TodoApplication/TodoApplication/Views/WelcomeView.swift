//
//  ContentView.swift
//  TodoApplication
//
//  Created by Daniel Konjarski & Carl Trinidad
//


struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to our TO-DO App")
                .font(.largeTitle)
                .padding()
            Spacer()
            Text("Daniel Konjarski & Carl Trinidad")
                .font(.smallTitle)
                .padding()
            Spacer()
            NavigationLink(destination: LoginView()) {
                Text("Start")
                    .padding()
                    .frame(width: 200)
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .foregroundColor(.white)
    }
}
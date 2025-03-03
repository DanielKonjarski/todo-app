//
//  ContentView.swift
//  TodoApplication
//
//  Created by Daniel Konjarski & Carl Trinidad
//


struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            Text("Welcome Back")
                .font(.largeTitle)
                .padding()
            TextField("Email", text: $email)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            SecureField("Password", text: $password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            NavigationLink(destination: DashboardView()) {
                Text("Login")
                    .padding()
                    .frame(width: 200)
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            NavigationLink("Sign Up", destination: SignUpView())
                .padding()
        }
        .padding()
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .foregroundColor(.white)
    }
}
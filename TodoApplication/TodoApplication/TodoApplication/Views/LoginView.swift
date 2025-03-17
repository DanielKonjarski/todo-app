//
//  TodoApp
//
//  Daniel Konjarski & Carl Trinidad - Group 59
//  101436648 & 101425882
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @State private var email = ""
    @State private var password = ""
    @State private var showAlert = false
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(.white)
                .padding()
                .background(Color.black)
                .cornerRadius(10)
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(.white)
                .padding()
                .background(Color.black)
                .cornerRadius(10)
            
            Button("Login") {
                if userViewModel.login(email: email, password: password) {
                    // Login successful, navigation will be handled by ContentView
                } else {
                    showAlert = true
                }
            }
            .padding()
            .background(Color.white)
            .foregroundColor(.black)
            .cornerRadius(10)
        }
        .padding()
        .background(Color.black)
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Login Failed"), message: Text("Please check your credentials and try again."), dismissButton: .default(Text("OK")))
        }
        .foregroundColor(.white)
    }
}

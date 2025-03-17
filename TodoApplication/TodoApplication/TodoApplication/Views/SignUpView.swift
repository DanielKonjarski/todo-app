//
//  TodoApp
//
//  Daniel Konjarski & Carl Trinidad - Group 59
//  101436648 & 101425882
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @State private var fullName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var navigateToAccepted = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Information").foregroundColor(.white)) {
                    TextField("Full Name", text: $fullName)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                    TextField("Email", text: $email)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                }

                Section(header: Text("Password").foregroundColor(.white)) {
                    SecureField("Password", text: $password)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                    SecureField("Confirm Password", text: $confirmPassword)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                }

                Section {
                    Button(action: signUp) {
                        Text("Sign Up")
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    }
                }
            }
            .navigationTitle("Create Account")
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
            .background(
                NavigationLink(destination: SignUpAcceptedView(), isActive: $navigateToAccepted) {
                    EmptyView()
                }
            )
            .background(Color.black)
            .foregroundColor(.white)
        }
    }

    private func signUp() {
        guard !fullName.isEmpty && !email.isEmpty && !password.isEmpty else {
            alertMessage = "Please fill in all fields"
            showAlert = true
            return
        }

        guard password == confirmPassword else {
            alertMessage = "Passwords do not match"
            showAlert = true
            return
        }

        if userViewModel.signUp(fullName: fullName, email: email, password: password) {
            navigateToAccepted = true
        } else {
            alertMessage = "Email already in use"
            showAlert = true
        }
    }
}

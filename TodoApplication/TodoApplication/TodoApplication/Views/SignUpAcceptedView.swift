//
//  TodoApp
//
//  Daniel Konjarski & Carl Trinidad - Group 59
//  101436648 & 101425882
//

import SwiftUI

struct SignUpAcceptedView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(.green)

            Text("Registration Successful!")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)

            Text("Your account has been created successfully.")
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(.white)

            Button(action: {
                // Dismiss this view and the SignUpView to return to the login screen
                presentationMode.wrappedValue.dismiss()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    presentationMode.wrappedValue.dismiss()
                }
            }) {
                Text("Return to Login")
                    .padding()
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
        }
        .padding()
        .background(Color.black)
        .foregroundColor(.white)
    }
}

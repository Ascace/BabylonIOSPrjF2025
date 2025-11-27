//
//  LoginView.swift
//  Babylon
//
//  Created by user278010 on 11/13/25.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var displayName = ""
    @State private var errorMessage: String?
    @StateObject private var auth = AuthService.shared
    
    var body: some View {
        Form {
            Section("Login") {
                TextField("Enter Email", text: $email)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .keyboardType(.emailAddress)
                    .foregroundColor(.white)
                
                SecureField("Enter a Password (Min 6 Chars)", text: $password)
                    .foregroundColor(.white)
            }
            .listRowBackground(Color(.secondarySystemBackground))
            
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            }
            
            Button("Login") {
                print("Login Clicked")
                
                guard Validators.isValidEmail(email) else {
                    self.errorMessage = "Invalid Email"
                    return
                }
                
                guard Validators.isValidPassword(password) else {
                    self.errorMessage = "Invalid Password"
                    return
                }
                
                auth.login(email: email, password: password) { result in
                    switch result {
                    case .success:
                        self.errorMessage = nil
                    case .failure(let failure):
                        self.errorMessage = failure.localizedDescription
                    }
                }
            }
            .disabled(email.isEmpty || password.isEmpty)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding()
            .background(Color.blue)      
            .foregroundColor(.white)
            .cornerRadius(8)
            .listRowBackground(Color(.secondarySystemBackground))
        }
       
        .scrollContentBackground(.hidden)
        .background(Color(.black))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    LoginView()
        .preferredColorScheme(.dark)
}


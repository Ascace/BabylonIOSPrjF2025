//
//  SignUpView.swift
//  Babylon
//
//  Created by user278010 on 11/13/25.
//

import SwiftUI

struct SignUpView: View
{
    @State private var userName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View
    {
        VStack(spacing: 20)
        {
            Text("Create Account")
                .font(.largeTitle)
                .bold()

            TextField("Username", text: $userName)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(action: {// Our User Sign up Back end logic will go here
            })
            {
                
                Text("Sign Up")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.brown)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }

            Spacer()
            
            NavigationLink("Already have an account? Log in", destination: LoginView())
                .padding(.top)
        }
        .padding()
        
    }
}


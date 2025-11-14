//
//  LoginView.swift
//  Babylon
//
//  Created by user278010 on 11/13/25.
//

import SwiftUI

struct LoginView: View
{
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View
    {
        VStack(spacing: 20)
        {
            Text("Login")
                .font(.largeTitle)
                .bold()

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(action: {
                // Our Back End Login logic will be here
            })
            {
                Text("Log In")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.brown)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }

            Spacer()
            
            NavigationLink("Don't have an account? Sign up", destination: SignUpView())
                .padding(.top)
        }
        .padding()
    }
}

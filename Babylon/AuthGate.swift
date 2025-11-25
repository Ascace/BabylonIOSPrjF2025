//
//  AuthGate.swift
//  Babylon
//
//  Created by user278010 on 11/22/25.
//

import SwiftUI

// switch between login and register pages

struct AuthGate: View {
    
    @State private var showLogin = true
    
    var body: some View {
        VStack{
            Picker("", selection: $showLogin){
                Text("Login").tag(true)
                Text("Register").tag(false)
            }.pickerStyle(.segmented)
                .padding()
            
            
            if showLogin {
                LoginView()
            }else {
                RegisterView()
            }
        }
    }
}

#Preview {
    AuthGate()
}

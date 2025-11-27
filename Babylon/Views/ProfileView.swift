//
//  ProfileView.swift
//  Babylon
//
//  Created by user278010 on 11/22/25.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject private var auth = AuthService.shared
    
    @State private var newName = ""
    @State private var errorMessage: String?
    
    
    var body: some View {
        Form {
            Section("Profile"){
                Text("Email: \(auth.currentUser?.email ?? "-")")
                Text("Display Name: \(auth.currentUser?.displayName ?? "-")")
                Text("Active: \(auth.currentUser?.isActive == true ? "Yes": "No")")
            }
            
            Section("Update Display Name") {
                TextField("New Display Name", text: $newName)
                
                Button("Save"){
                    guard !newName.trimmingCharacters(in: .whitespaces).isEmpty else {
                        self.errorMessage = "Display Name Cannot be Empty"
                        return
                    }
                    
                    auth.updateProfile(displayName: newName) {
                        result in
                        switch result {
                        case .success(let success):
                            self.newName = ""
                            self.errorMessage = ""
                        case .failure(let failure):
                            self.errorMessage = failure.localizedDescription
                        }
                    }
                }.disabled(newName.isEmpty)
            }
            
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundStyle(.red)
            }
            
            Button(role: .destructive) {
                let result = auth.signOut()
                if case .failure(let failure) = result {
                    self.errorMessage = failure.localizedDescription
                }else {
                    self.errorMessage = nil
                }
            } label: {
                Text("Sign Out")
            }
            
        }
        .onAppear {
            auth.fetchCurrentAppUser { _ in
            
            }
        }
    }
}

#Preview {
    ProfileView()
}

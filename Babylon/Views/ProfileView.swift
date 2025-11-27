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
            
            Section("Profile") {
                Text("Email: \(auth.currentUser?.email ?? "-")")
                    .foregroundColor(.white)
                Text("Display Name: \(auth.currentUser?.displayName ?? "-")")
                    .foregroundColor(.white)
                Text("Active: \(auth.currentUser?.isActive == true ? "Yes" : "No")")
                    .foregroundColor(.white)
            }
            .listRowBackground(Color(.secondarySystemBackground))
            
            
            Section("Update Display Name") {
                TextField("New Display Name", text: $newName)
                    .foregroundColor(.white)
                
                Button("Save") {
                    guard !newName.trimmingCharacters(in: .whitespaces).isEmpty else {
                        self.errorMessage = "Display Name Cannot be Empty"
                        return
                    }
                    
                    auth.updateProfile(displayName: newName) { result in
                        switch result {
                        case .success:
                            self.newName = ""
                            self.errorMessage = ""
                        case .failure(let failure):
                            self.errorMessage = failure.localizedDescription
                        }
                    }
                }
                .disabled(newName.isEmpty)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .listRowBackground(Color(.secondarySystemBackground))
            
            
            
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            }
            
            
            
            Button {
                let result = auth.signOut()
                if case .failure(let failure) = result {
                    self.errorMessage = failure.localizedDescription
                } else {
                    self.errorMessage = nil
                }
            } label: {
                Text("Sign Out")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)      
                    .cornerRadius(8)
            }
            .listRowBackground(Color(.secondarySystemBackground))
        }
        .scrollContentBackground(.hidden)
        .background(Color(.black))
        .preferredColorScheme(.dark)
        .onAppear {
            auth.fetchCurrentAppUser { _ in }
        }
    }
}

#Preview {
    ProfileView()
        .preferredColorScheme(.dark)
}


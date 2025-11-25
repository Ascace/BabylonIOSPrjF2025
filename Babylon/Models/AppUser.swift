//
//  AppUser.swift
//  Babylon
//
//  Created by user278010 on 11/22/25.
//

import Foundation
import FirebaseFirestore


// FirebaseAuth.User ---- User
struct AppUser: Identifiable, Codable {
    
    @DocumentID var id: String? // uid (firebaseAuth) ---> id (AppUser)
    let email: String
    var displayName: String
    var isActive: Bool = true
}

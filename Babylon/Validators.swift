//
//  Validators.swift
//  Babylon
//
//  Created by user278010 on 11/22/25.
//

import Foundation

// some validators
enum Validators {
    
    static func isValidEmail(_ email: String) -> Bool {
        let pattern = #"^\S+@\S+\.\S+$"#
        return email.range(of: pattern, options: .regularExpression) != nil
    }
    
    static func isValidPassword(_ password: String) -> Bool {
        return password.count >= 6
    }
}

// Custom Error  Object
struct SimpleError: Error {
    let message: String
    
    init(_ message: String) {
        self.message = message
    }
    
    var localizedDescription: String {
        return message
    }
}

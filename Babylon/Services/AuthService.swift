//
//  AuthService.swift
//  Babylon
//
//  Created by user278010 on 11/22/25.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseFirestore

class AuthService: ObservableObject {
    // Sinlgeton Pattern
    static let shared = AuthService()
    
    @Published var currentUser: AppUser?
    
    // DB Reference
    private let db = Firestore.firestore()
    
    // sign up
    func signUp(email: String, password: String, displayName: String, completion: @escaping(Result<AppUser, Error>)-> Void){
        
        // auth
        Auth.auth().createUser(withEmail: email, password: password) { result, error in if let error = error {
            print(error.localizedDescription)
            return completion(.failure(error))
        }
           // check for user
            guard let user = result?.user else {
                // no access to the error,
                return completion(.failure(SimpleError("Unable to create user")))
            }
            // appuser
            let uid = user.uid
            let appUser = AppUser(id: uid, email: email, displayName: displayName)
            
            // push it to the firestore
            
            do{
                try self.db.collection("users").document(uid).setData(from: appUser) {
                    error in
                    if let error = error {
                        print(error.localizedDescription)
                        completion(.failure(error))
                    }
                    
                    // update the currentUser
                    DispatchQueue.main.async {
                        self.currentUser = appUser // this will update the user in the main thread
                    }
                    completion(.success(appUser))
                }
            }catch{
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }
    
    // login
    func login(email: String, password: String, completion: @escaping (Result<AppUser?,Error>)-> Void){
        // login ---> uid (FirebaseAuth.User) -> fetch AppUser --> set the AppUser to current user
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
               return completion(.failure(error))
            }else if let user = result?.user {
                let uid = user.uid
                
                // fetch the AppUser from the firestore
                // self.fetchUser
                self.fetchCurrentAppUser { res in
                    switch res {
                    case .success(let appUserObj):
                        if let appUser = appUserObj {
                            completion(.success(appUser))
                        }else {
                            // create an empty record
                            let email = result?.user.email ?? "Unknown"
                            let name = result?.user.displayName ?? "Anonymous"
                            let appUser = AppUser(id: uid, email: email, displayName: name)
                            
                            // update this empty record for firestore
                            do{
                                try self.db.collection("users").document(uid).setData(from: appUser){
                                    error in
                                    if let error = error {
                                        print(error.localizedDescription)
                                        completion(.failure(error))
                                    }
                                    
                                    DispatchQueue.main.async{
                                        self.currentUser = appUser
                                    }
                                    
                                    completion(.success(appUser))
                                }
                            }catch {
                                print(error.localizedDescription)
                                completion(.failure(error))
                            }
                            // comple - failer
                        }
                    case . failure(let failure):
                        completion(.failure(failure))
                    }
                    
                }
            }
        }
    }
    
    // fetch current app user
    func fetchCurrentAppUser(completion: @escaping (Result<AppUser?, Error>)-> Void){
        
        // uid from FirebaseAuth
        guard let uid = Auth.auth().currentUser?.uid else {
            DispatchQueue.main.async {
                self.currentUser = nil
            }
            return completion(.success(nil))
        }
        db.collection("users").document(uid).getDocument { snap, error in
            if let error = error {
                return completion(.failure(error))
            }
            
            guard let snap = snap else {
                return completion(.success(nil))
            }
            
            do{
                let user = try snap.data(as: AppUser.self)
                
                DispatchQueue.main.async {
                    self.currentUser = user
                }
                completion(.success(user))
            }catch{
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }
    
    // updateDetails
    func updateProfile(displayName: String, completion: @escaping (Result<Void, Error>)-> Void){
        // uid
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return completion(.success(()))
        }
        
        db.collection("users").document(uid).updateData(["displayName":displayName]) {
            error in
            if let error = error {
                return completion(.failure(error))
            }else {
                self.fetchCurrentAppUser { _ in
                    completion(.success(()))
                }
            }
        }
    }
    
    //sign out
    func signOut() -> Result<Void, Error>{
        do {
            try Auth.auth().signOut()
            DispatchQueue.main.async {
                self.currentUser = nil
            }
            return .success(())
        }catch {
            print(error.localizedDescription)
            return .failure(error)
        }
    }
    

}

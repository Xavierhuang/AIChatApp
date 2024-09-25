//
//  DatabaseManager.swift
//  AIChatApp
//
//  Created by Weijia Huang on 9/25/24.
//

import Foundation
import FirebaseDatabase

final class DatabaseManager{
    
    static let shared = DatabaseManager()
    private let database = Database.database().reference()
    
}

// MARK: - Account Management
extension DatabaseManager {
    
    public func userExists(with email: String, completion: @escaping((Bool)-> Void)) {
        database.child(email).observeSingleEvent(of: .value, with:{ snapshot in guard let FoundEmail = snapshot.value as? String else{
            completion(false)
            return
            }
            completion(true)
        })
    }
    
    /// Insers new user to database
    public func insertUser(with user: ChatAppUser){
        database.child(user.emialAddress).setValue([
            "first_name": user.firstName,
            "last_name": user.lastName
        ])
    }
}


struct ChatAppUser{
    let firstName: String
    let lastName:String
    let emialAddress: String
    // let profilePictureUrl:String
}


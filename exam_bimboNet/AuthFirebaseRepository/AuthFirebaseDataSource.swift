//
//  AuthFirebaseDataSource.swift
//  exam_bimboNet
//
//  Created by Rogelio B on 21/12/23.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

final class AuthFirebaseDataSource{
    
    func createNewEmailUser(email: String, password: String, completionBlock: @escaping (Result<EmailUser, Error>) -> Void){
        
        Auth.auth().createUser(withEmail: email, password: password){ authResult, error in
            
            if let error = error{
                //print("error creating: \(error.localizedDescription)")
                completionBlock(.failure(error))
                return
            }
            let email = authResult?.user.email ?? "No hay email"
            //print("new user \(email)")
            completionBlock(.success(.init(email: email)))
        }
    }
    
    func getCurrentEmailUser() -> EmailUser?{
        guard let email = Auth.auth().currentUser?.email else{
            return nil
        }
        return .init(email: email)
    }
    
    func loginEmailUser(email: String, password: String, completionBlock: @escaping (Result<EmailUser, Error>) -> Void){
        
        Auth.auth().signIn(withEmail: email, password: password){ loginResult, error in
            
            if let error = error{
                //print("error login: \(error.localizedDescription)")
                completionBlock(.failure(error))
                return
            }
            let email = loginResult?.user.email ?? "No login"
            //print("user login \(email)")
            completionBlock(.success(.init(email: email)))
        }
    }
    
    func logoutEmailUser() throws{
        try Auth.auth().signOut()
    }
    
    func saveDataToFirebase(_ databaseSpaceships: [SpaceshipModel]){
        
        let rooRef = Database.database().reference()
        rooRef.child("databaseSpaceships").setValue(databaseSpaceships) {
            (ref:DatabaseReference, error:Error?) in
            
            if let error = error{
                print("error saving: \(error)")
            }
            //print("saving \(ref)")
        }
    }
        
    
}

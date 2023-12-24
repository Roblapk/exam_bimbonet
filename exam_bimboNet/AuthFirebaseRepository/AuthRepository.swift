//
//  AuthRepository.swift
//  exam_bimboNet
//
//  Created by Rogelio B on 21/12/23.
//

import Foundation

final class AuthRepository{
    
    //instance
    private let authFirebaseDataSource: AuthFirebaseDataSource
    
    init(authFirebaseDataSource: AuthFirebaseDataSource = AuthFirebaseDataSource()){
        self.authFirebaseDataSource = authFirebaseDataSource
    }
    
    func createNewUser(email: String, password: String, completionBlock: @escaping (Result<EmailUser, Error>) -> Void){
        authFirebaseDataSource.createNewEmailUser(email: email, password: password, completionBlock: completionBlock)
    }
    
    func getCurrentUser() -> EmailUser?{
        authFirebaseDataSource.getCurrentEmailUser()
    }
    
    func loginUser(email: String, password: String, completionBlock: @escaping (Result<EmailUser, Error>) -> Void){
        authFirebaseDataSource.loginEmailUser(email: email, password: password, completionBlock: completionBlock)
    }
    
    func logoutUser() throws{
        try authFirebaseDataSource.logoutEmailUser()
    }
    
    func saveDataToFirebase(_ databaseSpaceships: [SpaceshipModel]){
        authFirebaseDataSource.saveDataToFirebase(databaseSpaceships)
    }
    
}

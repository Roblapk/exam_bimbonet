//
//  AuthViewModel.swift
//  exam_bimboNet
//
//  Created by Rogelio B on 21/12/23.
//

import Foundation

final class AuthViewModel: ObservableObject{
    
    @Published var emailUser: EmailUser?
    @Published var errorMessage: String?
    
    //instance
    private let authRepository: AuthRepository
    
    init(authRepository: AuthRepository = AuthRepository()){
        self.authRepository = authRepository
        getCurrentUser()
    }
    
    func createNewUser(email: String, password: String){
        authRepository.createNewUser(email: email, password: password) { [weak self]  result in
            
            switch result{
                case .success(let user):
                        self?.emailUser = user
                case .failure(let error):
                        self?.errorMessage = error.localizedDescription
            }
            
        }
    }
    
    func getCurrentUser(){
        self.emailUser = authRepository.getCurrentUser()
    }
    
    func loginUser(email: String, password: String){
        authRepository.loginUser(email: email, password: password) { [weak self]  result in
            
            switch result{
                case .success(let user):
                        self?.emailUser = user
                case .failure(let error):
                        self?.errorMessage = error.localizedDescription
            }
            
        }
    }
    
    func logoutUser(){
        do {
            try authRepository.logoutUser()
            self.emailUser = nil
        } catch {
            print("Error Logout")
        }
    }
    
    func saveDataToFirebase(_ databaseSpaceships: [SpaceshipModel]){
        authRepository.saveDataToFirebase(databaseSpaceships)
    }
    
}

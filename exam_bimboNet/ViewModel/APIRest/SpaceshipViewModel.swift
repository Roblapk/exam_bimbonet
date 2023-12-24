//
//  SpaceshipViewModel.swift
//  exam_bimboNet
//
//  Created by Rogelio B on 21/12/23.
//

import Foundation
import Combine

class SpaceshipViewModel: ObservableObject{
    
    @Published var spaceships = [SpaceshipModel]()
    @Published var isLoading = true
    
    //instance
    private let apiService: APIServiceProtocol
    
    init(apiService: APIServiceProtocol = APIService()){
        self.apiService = apiService
    }
    
    func getSpaceships(){
        apiService.getSpaceShips { [weak self] result in
            DispatchQueue.main.async {
                switch result{
                    case .success(let spaceships):
                        self?.spaceships = spaceships
                        self?.isLoading = false
                    case .failure(let error):
                    print("Hubo un error: \(error.localizedDescription)")
                }
            }
        }
    }
    
}

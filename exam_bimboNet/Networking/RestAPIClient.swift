//
//  RestAPIClient.swift
//  exam_bimboNet
//
//  Created by Rogelio B on 21/12/23.
//

import Foundation
import Alamofire

class RestAPIClient{
    
    static func request<T: Codable>(type: T.Type, url:APIRouter, completionBlock: @escaping(Result<T, ErrorNetwork>) -> Void){
        AF.request(url).response{ response in
            let result = response.result
            switch result{
            case .success(let data):
                
                guard let data = data else {
                    completionBlock(.failure(.NoData))
                    return
                }
                guard let jsonObj = try? JSONDecoder().decode(T.self, from: data) else{
                    completionBlock(.failure(.DecodingError))
                    return
                }
                
                completionBlock(.success(jsonObj))
                
            case .failure(let error):
                completionBlock(.failure(.APIError(error.localizedDescription)))
            }
        }
    }
    
    static func getSpaceShips(completionBlock: @escaping(Result<[SpaceshipModel], ErrorNetwork>) -> Void){
        
        return request(type: [SpaceshipModel].self, url: APIRouter.getSpaceships, completionBlock: completionBlock)
        
    }
    
}

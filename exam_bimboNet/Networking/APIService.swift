//
//  APIRepository.swift
//  exam_bimboNet
//
//  Created by Rogelio B on 21/12/23.
//

import Foundation

protocol APIServiceProtocol{
    func getSpaceShips(completionBlock: @escaping(Result<[SpaceshipModel], ErrorNetwork>) -> Void)
}

class APIService: APIServiceProtocol{

    func getSpaceShips(completionBlock: @escaping(Result<[SpaceshipModel], ErrorNetwork>) -> Void){
        RestAPIClient.getSpaceShips(completionBlock: completionBlock)
    }
}

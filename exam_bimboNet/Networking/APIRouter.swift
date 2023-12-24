//
//  APIRouter.swift
//  exam_bimboNet
//
//  Created by Rogelio B on 21/12/23.
//

import Foundation
import Alamofire

public enum APIRouter: URLRequestConvertible{

    case getSpaceships
    
    private var urlPath: String{
        switch self{
            case .getSpaceships:
                return "https://api.spacexdata.com/v3/launches/past"
        }
    }
    
    private var method: HTTPMethod{
        switch self{
        case .getSpaceships:
            return .get
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = try urlPath.asURL()
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        return urlRequest
    }
    
}

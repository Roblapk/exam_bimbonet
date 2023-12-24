//
//  NetworkError.swift
//  exam_bimboNet
//
//  Created by Rogelio B on 22/12/23.
//

import Foundation

enum ErrorNetwork: Error{
    case BadURL
    case NoData
    case DecodingError
    case APIError(String)
}

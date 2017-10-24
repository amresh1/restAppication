//
//  APIConfiguration.swift
//  DemoApi
//
//  Created by owner on 10/12/17.
//  Copyright © 2017 owner. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper
import Alamofire

protocol ApiConfiguration {
    var baseUrl : String {get}
    var method : HTTPMethod {get}
    var accessToken : String {get}
    var path : String {get}
    var parameters : [String: Any] {get}
}

extension ApiConfiguration{
    var baseUrl : String{
        return "http://iography.in/eSchool"
    }
}

enum ApiPrefernces : ApiConfiguration {
    case home()
    
    var path: String{
        switch self {
        // sample 
        case .home:
            return "/home.json"
        default:
            return ""
        }
     }
    
    var method: HTTPMethod {
        switch self {
        case .home:
            return .get
        default:
            return .get
        }
    }
    
    var accessToken: String{
        return "Bearer"
    }
    
    var parameters: [String : Any]{
        switch self {
        case .home:
            return [:]
        default:
            return [:]
            
        }
    }
    
}





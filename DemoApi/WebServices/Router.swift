//
//  Router.swift
//  DemoApi
//
//  Created by owner on 10/12/17.
//  Copyright © 2017 owner. All rights reserved.
//

import Foundation
import Alamofire

class Router :URLRequestConvertible, ApiConfiguration{
    var preferences = ApiPrefernces.self
    
    public func asURLRequest() throws -> URLRequest {
        let completeUrl = baseUrl.appending(path)
        let urlWithOutPercent = completeUrl.removingPercentEncoding
        let finalUrl = URL(String: urlWithOutPercent)
        
        var request = URLRequest(url: finalUrl!)
        request.httpMethod = method.rawValue
        request.setValue(accessToken, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.timeoutInterval = TimeInterval(10 * 1000)
        
        return try JSONEncoding.default.encode(request, with: parameter)
        
    }
    
    var method: HTTPMethod{
        return preferences.method
    }
    
    var accessToken: String{
        return preferences.accessToken
    }
    
    var path: String{
        return preferences.path
    }
    
    var parameter: [String : Any]{
        return preferences.parameter
    }
    
}

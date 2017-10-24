//
//  RestManager.swift
//  DemoApi
//
//  Created by owner on 10/12/17.
//  Copyright © 2017 owner. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

extension DataRequest {
    public func dLog() -> Self {
        debugPrint(self)
        return self
    }
}


class RestManager: NSObject {
    static func responseObject<T: Mappable>(with requestConvertible: URLRequestConvertible, mapToObject object: T? = nil, completion: @escaping(T?) -> Void = { _ in }, responseCode: @escaping (Int?) ->Void = { _ in },responseJson: @escaping ([String: Any]?) -> Void = { _ in }, connectionFailure: @escaping (Bool) -> Void) -> Void {
        
        Alamofire.request(requestConvertible)
            .validate(statusCode: 200..<300)
            .dLog()
            .responseJSON(completionHandler: { (response) in
                responseCode(response.response?.statusCode)
                responseJson(response.value as? [String: Any])
            })
            .responseObject { (response: DataResponse<T>) in
                
                if response.result.isFailure{
                    debugPrint("Server error: \(String(describing: response.result.error?.localizedDescription))")
                    
                    if let err = response.result.error as? URLError, err.code == URLError.Code.notConnectedToInternet{
                        connectionFailure(true)
                    }else{
                        // Alert msg -> response.result.error?.localizedDescription
                        connectionFailure(false)
                    }
                    return
                }
                
                completion(response.result.value)
        }
    }
}

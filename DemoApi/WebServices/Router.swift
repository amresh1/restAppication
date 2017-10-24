

import Foundation
import Alamofire

class Router: URLRequestConvertible, ApiConfiguration{
     var preference: ApiPrefernces
    
    var path: String {
        return preference.path
    }
    
    var method: HTTPMethod {
        return preference.method
    }
    
    var accessToken: String {
        return preference.accessToken
    }
    
    var parameters: [String : Any]{
        return preference.parameters
    }
    
    init(preference: ApiPrefernces) {
        self.preference = preference
    }
    
    public func asURLRequest() throws -> URLRequest {
        let completeUrl = baseUrl.appending(path)
        let urlWithoutOutpercent = completeUrl.removingPercentEncoding
        let finalUrl = URL(string: urlWithoutOutpercent!)
        
        var request = URLRequest(url: finalUrl!)
        request.httpMethod = method.rawValue
        request.setValue(accessToken, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.timeoutInterval = TimeInterval(10 * 1000)
        
        return try JSONEncoding.default.encode(request, with: parameters)
    }
}


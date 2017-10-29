//
//  Dictionary+Extension.swift
//  DemoApi
//
//  Created by owner on 10/29/17.
//  Copyright © 2017 owner. All rights reserved.
//

import Foundation
extension Dictionary {
    
    func JSONString() -> String {
        if let JSONData = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted) {
            let JSONString = String(bytes: JSONData, encoding: String.Encoding.utf8)
            return JSONString!
        }
        return ""
    }
}

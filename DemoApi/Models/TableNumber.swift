//
//  TableNumber.swift
//  DemoApi
//
//  Created by owner on 11/4/17.
//  Copyright © 2017 owner. All rights reserved.
//

import Foundation
class TableNumber{
    var id : Int
    var image: String
    var tableNumber: String
    
    init(_ id: Int,_ image: String, _ tableNumber: String) {
        self.id = id
        self.image = image
        self.tableNumber = tableNumber
    }
}

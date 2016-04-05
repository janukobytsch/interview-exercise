//
//  BaseModel.swift
//  Mosaik
//
//  Created by Janusch Jacoby on 24/01/16.
//  Copyright © 2016 Janusch Jacoby. All rights reserved.
//

import ObjectMapper

class BaseModel: Mappable {
    
    var id: Int?
    var createdDate: NSDate?
    var updatedDate: NSDate?
    
    init() {}
    
    // MARK: Mappable
    
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        id <- map["id"]
        createdDate <- (map["created_on"], DateTransform())
        updatedDate <- (map["updated_on"], DateTransform())
    }
}

//
//  Tag.swift
//  Mosaik
//
//  Created by Jakob Frick on 11/03/16.
//  Copyright © 2016 Janusch Jacoby. All rights reserved.
//

import ObjectMapper

class Tag: BaseModel {
    
    var positionX: Float?
    var positionY: Float?
    
    // MARK: Mappable
    
    required init?(_ map: Map) {
        super.init(map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map)
        
        positionX <- map["position_x"]
        positionX <- map["position_y"]
    }
}
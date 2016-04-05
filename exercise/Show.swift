//
//  Show.swift
//  Mosaik
//
//  Created by Janusch Jacoby on 24/01/16.
//  Copyright © 2016 Janusch Jacoby. All rights reserved.
//

import ObjectMapper

class Show: BaseModel {
    
    var image: Image?
    var tags: [Tag]?
    
    // MARK: Mappable
    
    required init?(_ map: Map) {
        super.init(map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map)
        
        image <- map["image"]
        tags <- map["tags"]
    }
    
    // MARK: Factory method
    
    static func generateTestShow() -> Show {
        guard let path = NSBundle(forClass: self).pathForResource("test_show", ofType: "json") else {
            fatalError("Could find json to load show from")
        }
        
        var data: String?
        do {
            data = try String(contentsOfFile: path)
        } catch {
            fatalError("Could not load show from json")
        }
        
        return Mapper<Show>().map(data)!
    }
}
//
//  Image.swift
//  Mosaik
//
//  Created by Janusch Jacoby on 24/01/16.
//  Copyright © 2016 Janusch Jacoby. All rights reserved.
//

import ObjectMapper

class Image: BaseModel {
    
    var previewUrl: String?
    var smallUrl: String?
    var mediumUrl: String?
    var largeUrl: String?
    
    var urls: [String?] {
        return [previewUrl, smallUrl, mediumUrl, largeUrl]
    }
    
    var smallestUrl: String? {
        return urls.detect({ $0 != nil }) ?? previewUrl
    }
    
    var largestUrl: String? {
        return urls.reverse().detect({ $0 != nil }) ?? largeUrl
    }
    
    override init() {
        super.init()
    }
    
    // MARK: Mappable
    
    required init?(_ map: Map) {
        super.init(map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map)
        
        previewUrl <- map["preview_url"]
        smallUrl <- map["small_url"]
        mediumUrl <- map["medium_url"]
        largeUrl <- map["large_url"]
    }
}

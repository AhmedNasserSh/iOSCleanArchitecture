//
//  SearchItemEntity.swift
//  iOS Clean Architecture
//
//  Created by Ahmed Nasser on 12/5/19.
//  Copyright © 2019 AvaVaas. All rights reserved.
//

import Foundation
import ObjectMapper
class SearchItemEntity :Mappable  {
    
    var photoResponse : SearchItem?
    
    required init?(map: Map) { }
    func mapping(map: Map) {
        photoResponse <- map["photos"]
    }
}
class SearchItem :Mappable {
    var page : Int?
    var pages : Int?
    var perpage : Int?
    var photos : [PhotoEntity]?
    
    init() {}
    required init?(map: Map) { }

    func mapping(map: Map) {
        page <- map["page"]
        pages <- map["pages"]
        perpage <- map["perpage"]
        photos <- map["photo"]
    }
}

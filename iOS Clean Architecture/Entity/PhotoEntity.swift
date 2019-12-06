//
//  PhotoEntity.swift
//  iOS Clean Architecture
//
//  Created by Ahmed Nasser on 12/5/19.
//  Copyright © 2019 AvaVaas. All rights reserved.
//

import Foundation
import ObjectMapper
class PhotoEntity : Mappable {
    var farm : Int?
    var id : String?
    var server : String?
    var secret : String?
    var image :UIImage?
    
    required init?(map: Map) {}
    func mapping(map: Map) {
        farm <- map["farm"]
        id <- map["id"]
        server <- map["server"]
        secret <- map["secret"]
    }

    func getImageURL(_ size:String = "m") -> URL? {
        guard let f = farm , let s = server ,let i = id ,let c = secret else{ return nil}
        if let url =  URL(string: "https://farm\(f).staticflickr.com/\(s)/\(i)_\(c)_\(size).jpg") {
            return url
        }
        return nil
    }
}

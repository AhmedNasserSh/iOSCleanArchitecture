//
//  NetworkConstants.swift
//  iOS Clean Architecture
//
//  Created by Ahmed Nasser on 12/5/19.
//  Copyright © 2019 AvaVaas. All rights reserved.
//

import Foundation
enum SearchMethod :String{
    case images = "flickr.photos.search"
    case groups = "flickr.groups.search"
}
struct APIConstant {
    static let flickerApiKey = "77b714cd4503f9b42968c0110fb1b15c"
    static let baseURL = "https://api.flickr.com/services/rest/"
}
struct Environments {
    static var production = Environment("production", host: APIConstant.baseURL)
}

//
//  Response.swift
//  iOS Clean Architecture
//
//  Created by Ahmed Nasser on 12/5/19.
//  Copyright © 2019 AvaVaas. All rights reserved.
//

import Foundation

public enum Response {
    case json(_: NSDictionary)
    case data(_: Data)
    case error(_: Int?, _: Error?)
    
    init(_ response: (r: HTTPURLResponse?, data: Data?, error: Error?), for request: NetworkRequest) {
        guard response.r?.statusCode == 200, response.error == nil else {
            self = .error(response.r?.statusCode, response.error)
            return
        }
        
        guard let data = response.data else {
            self = .error(response.r?.statusCode, NetworkErrors.noData)
            return
        }
        
        switch request.dataType {
        case .data:
            self = .data(data)
        case .json:
            let json = try? JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary 
            self =  .json(json ?? [:])
        }
    }
    var response :Any? {
        switch self {
        case .json(let dic):
            return dic
        case .data(let data) :
            return data
        default:
            return nil
        }
    }
}

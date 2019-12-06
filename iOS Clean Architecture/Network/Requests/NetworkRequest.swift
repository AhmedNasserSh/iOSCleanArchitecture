//
//  NetworkRequest.swift
//  iOS Clean Architecture
//
//  Created by Ahmed Nasser on 12/5/19.
//  Copyright © 2019 AvaVaas. All rights reserved.
//

import Foundation
public enum DataType {
    case json
    case data
}
public protocol NetworkRequest {
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: RequestParams { get }
    var headers: [String: Any]? { get }
    var dataType: DataType { get }
}
public enum HTTPMethod: String {
    case post = "POST"
    case put = "PUT"
    case get = "GET"
    case delete = "DELETE"
    case patch = "PATCH"
}
public enum RequestParams {
    case body(_ : [String: Any]?)
    case url(_ : [String: Any]?)
}

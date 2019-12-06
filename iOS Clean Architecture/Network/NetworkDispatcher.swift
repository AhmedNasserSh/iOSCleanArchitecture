//
//  NetworkDispatcher.swift
//  iOS Clean Architecture
//
//  Created by Ahmed Nasser on 12/5/19.
//  Copyright © 2019 AvaVaas. All rights reserved.
//

import Foundation
import Hydra

public struct Environment {
    /// Name of the environment
    public var name: String
    /// Base URL of the environment
    public var host: String
    /// This is the list of common headers which will be part of each Request
    /// Some headers value maybe overwritten by Request's own headers
    public var headers: [String: Any] = [:]
    /// Cache policy
    public var cachePolicy: URLRequest.CachePolicy = .reloadIgnoringLocalAndRemoteCacheData
    /// Initialize a new Environment
    ///
    /// - Parameters:
    ///   - name: name of the environment
    ///   - host: base url
    public init(_ name: String, host: String) {
        self.name = name
        self.host = host
    }
}

public protocol NetworkDispatcher {
    /// Configure the dispatcher with an environment
    ///
    /// - Parameter environment: environment configuration
    init(environment: Environment)
    /// This function execute the request and provide a Promise
    /// with the response.
    ///
    /// - Parameter request: request to execute
    func execute(request: NetworkRequest) throws -> Promise<Response>
}

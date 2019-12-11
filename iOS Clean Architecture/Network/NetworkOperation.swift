//
//  NetworkOperation.swift
//  iOS Clean Architecture
//
//  Created by Ahmed Nasser on 12/6/19.
//  Copyright © 2019 AvaVaas. All rights reserved.
//

import Foundation
import Hydra
import ObjectMapper
import Combine
public protocol NetworkOperationBase: class{}

protocol NetworkOperation :NetworkOperationBase {
    /// Request to execute
    var request: NetworkRequest? { get set}
    var isCancled : Bool? { get set}
    
    /// Execute request in passed dispatcher
    ///
    /// - Parameter dispatcher: dispatcher
    /// - Returns: a promise
    func execute(in dispatcher: NetworkDispatcher) -> Deferred<Future<Any,Error>>
    
}

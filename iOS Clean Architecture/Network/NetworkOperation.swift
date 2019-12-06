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
public protocol NetworkOperationBase: class{}
protocol NetworkOperation :NetworkOperationBase {
    /// Request to execute
    var request: NetworkRequest? { get set}
    
    
    /// Execute request in passed dispatcher
    ///
    /// - Parameter dispatcher: dispatcher
    /// - Returns: a promise
    func execute(in dispatcher: NetworkDispatcher) -> Promise<Mappable>
    
}

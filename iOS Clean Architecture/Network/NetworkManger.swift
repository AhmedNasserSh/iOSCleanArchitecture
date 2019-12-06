//
//  NetworkManger.swift
//  iOS Clean Architecture
//
//  Created by Ahmed Nasser on 12/5/19.
//  Copyright © 2019 AvaVaas. All rights reserved.
//

import Foundation
import Hydra
import Alamofire
public enum NetworkErrors: Error {
    case badInput
    case noData
}

public class NetworkManger: NetworkDispatcher {

    private var environment: Environment
    private var session: URLSession
    required public init(environment: Environment) {
        self.environment = environment
        self.session = URLSession(configuration: URLSessionConfiguration.default)
    }
    public func execute(request: NetworkRequest) throws -> Promise<Response> {
        let rqe = try self.prepareURLRequest(for: request)
    
        return Promise<Response>(in: .background, { resolve, _, _  in
            let d = self.session.dataTask(with: rqe, completionHandler: { (data, urlResponse, error) in
                let response = Response( (urlResponse as? HTTPURLResponse,data,error), for: request)
                resolve(response)
            })
            d.resume()
        })
    }
    private func prepareURLRequest(for request: NetworkRequest) throws -> URLRequest {
        // Compose the url
        let full_url = "\(environment.host)\(request.path)"
        var url_request = URLRequest(url: URL(string: full_url)!)
        
        // Working with parameters
        switch request.parameters {
        case .body(let params):
            // Parameters are part of the body
            if let params = params { // just to simplify
                url_request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .init(rawValue: 0))
            } else {
                throw NetworkErrors.badInput
            }
        case .url(let params):
            // Parameters are part of the url
            if let params = params { // just to simplify
                var queryItems = [URLQueryItem]()
                for parm in params  {
                    queryItems.append(URLQueryItem(name: parm.key, value: parm.value as? String))
                }
                guard var components = URLComponents(string: full_url) else {
                    throw NetworkErrors.badInput
                }
                components.queryItems = queryItems
                url_request.url = components.url
            } else {
                throw NetworkErrors.badInput
            }
        }
        
        // Add headers from enviornment and request
        environment.headers.forEach { url_request.addValue($0.value as! String, forHTTPHeaderField: $0.key) }
        request.headers?.forEach { url_request.addValue($0.value as! String, forHTTPHeaderField: $0.key) }
        
        // Setup HTTP method
        url_request.httpMethod = request.method.rawValue
        
        return url_request
    }
}

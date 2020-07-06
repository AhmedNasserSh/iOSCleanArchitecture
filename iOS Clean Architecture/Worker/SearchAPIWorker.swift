//
//  SearchAPIWorker.swift
//  iOS Clean Architecture
//
//  Created by Ahmed Nasser on 12/5/19.
//  Copyright © 2019 AvaVaas. All rights reserved.
//

import Foundation
import Hydra
import ObjectMapper
import SwiftyJSON
import Combine
class SearchAPIWorker: NetworkOperation{
    var request: NetworkRequest?
    typealias Output = SearchItemEntity
    var isCancled: Bool? = false
    var query:String
    var page:Int
    
    init(query:String, page:Int) {
        self.query = query
        self.page = page
        self.request = SearchRequest.search(query: query, page: page)
    }
    
    func execute(in dispatcher: NetworkDispatcher) -> Deferred<Future<Any, Error>> {
        return  Deferred {
            return  Future<Any, Error> { (promise) in
                do {
                    try dispatcher.execute(request: self.request!).then({ response in
                        if let searchResponse = Mapper<Output>().map(JSONObject: response.response as? NSDictionary ) {
                            promise(.success(searchResponse))
                        }
                    })
                } catch {
                    promise(.failure(error))
                }
            }
        }
    }
    
}

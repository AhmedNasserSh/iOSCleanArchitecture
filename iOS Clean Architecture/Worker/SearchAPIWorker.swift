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
class SearchAPIWorker: NetworkOperation{
    var request: NetworkRequest?
    typealias Output = SearchItemEntity
    
    var query:String
    var page:Int
    
    init(query:String, page:Int) {
        self.query = query
        self.page = page
        self.request = SearchRequest.search(query: query, page: page)
    }
    
    func execute(in dispatcher: NetworkDispatcher) -> Promise<Mappable> {
        return Promise<Mappable>({ resolve, reject, _  in
            do {
                try dispatcher.execute(request: self.request!).then({ response in
                    
                    if let searchResponse = Mapper<Output>().map(JSONObject: response.response as? NSDictionary ) {
                        resolve(searchResponse)
                    }
                }).catch(reject)
            } catch {
                reject(error)
            }
        })
    }
}

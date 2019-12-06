//
//  SearchRequest.swift
//  iOS Clean Architecture
//
//  Created by Ahmed Nasser on 12/5/19.
//  Copyright © 2019 AvaVaas. All rights reserved.
//

import Foundation
public enum SearchRequest: NetworkRequest {

    case search(query:String, page:Int)
    public var path: String {
      return ""
    }
    public var method: HTTPMethod {
        return .get
    }
    public var parameters: RequestParams {
        switch self {
        case .search(let query, let page):
            return .url(["method": SearchMethod.images.rawValue, "api_key": APIConstant.flickerApiKey,
                          "tags": query, "format": "json", "nojsoncallback": "?", "in_gallery": 1,
                          "per_page": 20, "page": page ,])
        }
    }
    public var headers: [String: Any]? {
        switch self {
        default:
            return nil
        }
    }

    public var dataType: DataType {
        switch self {
        case .search(_, _):
            return .json
        }
    }
}

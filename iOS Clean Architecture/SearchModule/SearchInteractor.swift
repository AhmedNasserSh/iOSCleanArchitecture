//
//  SearchInteractor.swift
//  iOS Clean Architecture
//
//  Created by Ahmed Nasser on 12/6/19.
//  Copyright © 2019 AvaVaas. All rights reserved.
//

import Foundation
import Combine
class SearchInteractor  {
    private var searchEntity:SearchItem?
    private let apiWorker: NetworkOperation
    var presenter: SearchPresnterProtocol?
    private var subscriptions = Set<AnyCancellable>()

    required init(withApiWorker apiWorker:NetworkOperation) {
        self.apiWorker = apiWorker
    }
}
extension SearchInteractor: SearchInteractorProtocol{
    func getSearchData(query:String, page:Int) {
        presenter?.showProgress(true)
        apiWorker.request = SearchRequest.search(query: query, page: page)
        apiWorker.execute(in: NetworkManger(environment: Environments.production)).sink(receiveCompletion: { (error) in
            print(error)
        }) { (response) in
            if let searchReeponse = response as? SearchItemEntity, let searchItem = searchReeponse.photoResponse {
                self.presenter?.interactor(self, didFetch: searchItem)
            }
        }.store(in: &subscriptions)
    }
}

//
//  SearchPresenter.swift
//  iOS Clean Architecture
//
//  Created by Ahmed Nasser on 12/6/19.
//  Copyright © 2019 AvaVaas. All rights reserved.
//

import Foundation
class SearchPresenter {
    var view :SearchViewProtocol?
}
extension SearchPresenter: SearchPresnterProtocol  {
    func interactor(_ interactor: SearchInteractorProtocol, didFetch object: SearchItem) {
        self.view?.showProgress(false)
        view?.set(viewModel: object)
    }
    
    func interactor(_ interactor: SearchInteractorProtocol, didFailWith error: Error) {
        // Manage fetch failure
        self.view?.showProgress(false)
        self.view?.setFaliure(error: error)
    }
    func showProgress(_ show: Bool) {
        self.view?.showProgress(show)
    }
}


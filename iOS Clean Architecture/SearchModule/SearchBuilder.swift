//
//  SearchBuilder.swift
//  iOS Clean Architecture
//
//  Created by Ahmed Nasser on 12/6/19.
//  Copyright © 2019 AvaVaas. All rights reserved.
//

import Foundation
import UIKit
class SearchBuilder {
    
    class func buildModule() -> SearchViewController  {
        //MARK: Initialise components.
        let presenter = SearchPresenter()
        let interactor = SearchInteractor(withApiWorker: SearchAPIWorker(query: "nature", page: 1))
        let wireframe = SearchWireFrame()
        let searchView = UIStoryboard(name: "Search", bundle: nil).instantiateInitialViewController() as! SearchViewController

        //MARK: link VIP components.
        searchView.interactor = interactor
        searchView.wireframe = wireframe
        presenter.view = searchView
        interactor.presenter = presenter
        return searchView
    }
}

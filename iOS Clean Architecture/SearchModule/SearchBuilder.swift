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
    
    class func buildModule(view :inout SearchViewProtocol)   {
        //MARK: Initialise components.
        let presenter = SearchPresenter()
        let interactor = SearchInteractor(withApiWorker: SearchAPIWorker(query: "nature", page: 1))
        let wireframe = SearchWireFrame()

        //MARK: link VIP components.
        view.interactor = interactor
        view.wireframe = wireframe
        presenter.view = view
        interactor.presenter = presenter
    }
}

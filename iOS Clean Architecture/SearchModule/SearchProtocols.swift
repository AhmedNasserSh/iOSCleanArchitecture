//
//  SearchProtocols.swift
//  iOS Clean Architecture
//
//  Created by Ahmed Nasser on 12/6/19.
//  Copyright © 2019 AvaVaas. All rights reserved.
//

import Foundation
import Hydra
enum SearchNavigationOption {
}
protocol SearchWireframeProtocol: BaseWireframeProtocol {
    func navigate(to option: SearchNavigationOption)
}
protocol SearchInteractorProtocol {
    func getSearchData(query:String, page:Int)
}
protocol SearchPresnterProtocol {
    func interactor(_ interactor: SearchInteractorProtocol, didFetch object: SearchItem)
    func showProgress(_ show:Bool)
}
protocol SearchViewProtocol {
    var interactor: SearchInteractorProtocol? {set get}
    var wireframe: SearchWireframeProtocol? {set get}
    func set(viewModel: SearchItem)
    func setFaliure(error:Error)
    func showProgress(_ show:Bool)
}

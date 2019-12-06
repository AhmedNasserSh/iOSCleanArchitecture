//
//  SearchViewController.swift
//  iOS Clean Architecture
//
//  Created by Ahmed Nasser on 12/6/19.
//  Copyright © 2019 AvaVaas. All rights reserved.
//

import UIKit
import KVNProgress
class SearchViewController: UIViewController,SearchViewProtocol {
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var imageCollectionView: UICollectionView!
    var interactor: SearchInteractorProtocol?
    var wireframe: SearchWireframeProtocol?
    var viewModel: SearchItem?
    var query = ""
    var page = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.getSearchData(query: query, page: page)
    }
    func didTabSearch() {
        interactor?.getSearchData(query: searchTextField.text ?? "", page: page)
    }
    
}
extension SearchViewController :UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        didTabSearch()
        return true
    }
    
}
extension SearchViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel?.photos?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        let photo = viewModel?.photos?[indexPath.row]
        cell.setImage(photo: photo)
        return cell
    }
}
extension SearchViewController  {
    func set(viewModel: SearchItem) {
        self.viewModel = viewModel
        imageCollectionView.reloadData()
    }
    func setFaliure(error: Error) {
        
    }
    func showProgress(_ show: Bool) {
        if show {
            KVNProgress.show()
        }else{
            KVNProgress.dismiss()
        }
    }
}

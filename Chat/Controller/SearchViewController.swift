//
//  SearchViewController.swift
//  Chat
//
//  Created by narendra. vadde on 23/09/20.
//  Copyright © 2020 narendra. vadde. All rights reserved.
//

import UIKit

class SearchViewController: BaseViewController {

    @IBOutlet var searchView: SearchView!
    
    var viewModel: SearchViewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchView.delegate = self
        viewModel.delegate = self
        viewModel.getData()
    }
}

extension SearchViewController: ChatSearchViewDelegate {
    func chatSearchTextFieldTextDidChange(text: String) {
        viewModel.chatSearchTextFieldTextDidChange(text: text)
    }
    
    func searchTextFieldTextDidChange(text: String) {
        viewModel.searchTextFieldTextDidChange(text: text)
    }
    
    func backTapped() {
        viewModel.backTapped()
    }
    
    func chatSearchCancelTapped() {
        viewModel.chatSearchCancelTapped()
    }
    
    func searchCancelTapped() {
        viewModel.searchCancelTapped()
    }
}

extension SearchViewController: SearchViewModelDelegate {
    func updateUI() {
        searchView.dataSource = viewModel
        searchView.reloadData()
    }
}

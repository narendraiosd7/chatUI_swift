//
//  ActionsViewController.swift
//  Chat
//
//  Created by narendra. vadde on 23/09/20.
//  Copyright © 2020 narendra. vadde. All rights reserved.
//

import UIKit

class ActionsViewController: BaseViewController {

    @IBOutlet var actionsView: ActionsView!
    
    var viewModel: ChatDetailViewModel = ChatDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        actionsView.delegate = self
        viewModel.delegate = self
        viewModel.getData()
    }
}

extension ActionsViewController: ActionsViewDelegate {
    func backgroundTapped() {
        viewModel.backgroundTapped()
    }
    
    func muteTapped() {
        viewModel.muteTapped()
    }
    
    func blockTapped() {
        viewModel.blockTapped()
    }
}

extension ActionsViewController: ChatDetailViewModelDelegate {
    func updateUI() {
        actionsView.dataSource = viewModel
    }
}

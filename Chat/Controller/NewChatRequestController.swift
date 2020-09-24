//
//  NewChatRequestController.swift
//  Chat
//
//  Created by narendra. vadde on 24/09/20.
//  Copyright © 2020 narendra. vadde. All rights reserved.
//

import UIKit

class NewChatRequestController: BaseViewController {

    @IBOutlet var newchatRequestView: NewChatRequestView!
    
    var viewModel: ChatViewModel = ChatViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newchatRequestView.delegate = self
        viewModel.delegate = self
        viewModel.getData()
    }
}

extension NewChatRequestController: NewChatRequestViewDelegate {
    func searchTapped() {
        viewModel.searchTapped()
    }
    
    func zNotificationTapped() {
        viewModel.zNotificationTapped()
    }
    
    func moreTapped() {
        viewModel.moreTapped()
    }
}

extension NewChatRequestController: ChatViewModelDelegate {
    func stateGotUpdated() {
        
    }
    
    func updateUI() {
        newchatRequestView.dataSource = viewModel
        newchatRequestView.reloadData()
    }
}

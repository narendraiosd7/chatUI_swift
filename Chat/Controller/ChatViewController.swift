//
//  ChatViewController.swift
//  Mobile-ZeeMusic
//
//  Created by narendra. vadde on 16/09/20.
//  Copyright © 2020 narendra. vadde. All rights reserved.
//

import UIKit

protocol ChatViewControllerDelegate: class {
    func stateGotUpdated()
}

class ChatViewController: BaseViewController {

    @IBOutlet var chatView: ChatView!
    
    weak var delegate: ChatViewControllerDelegate?
    var viewModel: ChatViewModel = ChatViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chatView.delegate = self
        viewModel.delegate = self
        viewModel.getData()
    }
}

extension ChatViewController: ChatViewDelegate {
    func helpChat() {
        viewModel.helpTapped()
    }
    
    func chatNotificationTapped() {
        viewModel.chatNotificationTapped()
    }
    
    func selectedChatDetails(source: BaseTableViewCellDataSource?) {
        viewModel.selectedChatDetails(source: source)
    }
    
    func searchTapped() {
        viewModel.searchTapped()
    }
    
    func zNotificationTapped() {
        viewModel.zNotificationTapped()
    }
    
    func moreTapped() {
        viewModel.moreTapped()
    }
    
    func homeTapped() {
        viewModel.homeTapped()
    }
    
    func newsTapped() {
        viewModel.newsTapped()
    }
    
    func postTapped() {
        viewModel.postTapped()
    }
    
    func chatTapped() {
        viewModel.chatTapped()
    }
    
    func exploreTapped() {
        viewModel.exploreTapped()
    }
}

extension ChatViewController: ChatViewModelDelegate {
    func stateGotUpdated() {
        delegate?.stateGotUpdated()
    }
    
    func updateUI() {
        chatView.dataSource = viewModel
        chatView.reloadData()
    }
}

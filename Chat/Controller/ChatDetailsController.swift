//
//  ChatDetailsController.swift
//  Chat
//
//  Created by narendra. vadde on 21/09/20.
//  Copyright © 2020 narendra. vadde. All rights reserved.
//

import UIKit

class ChatDetailsController: BaseViewController {

    @IBOutlet var chatDetailView: ChatDetailView!
    
    var viewModel: ChatDetailViewModel = ChatDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chatDetailView.delegate = self
        viewModel.delegate = self
        viewModel.getData()
    }
}

extension ChatDetailsController: ChatDetailViewDelegate {
    func attachmentTapped() {
        viewModel.attachmentTapped()
    }
    
    func emojiTapped() {
        viewModel.emojiTapped()
    }
    
    func cameraTapped() {
        viewModel.cameraTapped()
    }
    
    func recordOrSendTapped() {
        viewModel.microphoneTapped()
    }
    
    func backTapped() {
        viewModel.backTapped()
    }
    
    func moreTapped() {
        viewModel.moreTapped()
    }
}

extension ChatDetailsController: ChatDetailViewModelDelegate {
    func updateUI() {
        chatDetailView.dataSource = viewModel
        chatDetailView.reloadData()
    }
}


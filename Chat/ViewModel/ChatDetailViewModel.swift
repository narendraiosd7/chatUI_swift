//
//  ChatDetailViewModel.swift
//  Chat
//
//  Created by narendra. vadde on 21/09/20.
//  Copyright © 2020 narendra. vadde. All rights reserved.
//

import Foundation
import UIKit

protocol ChatDetailViewModelDelegate: BaseViewModelDelegate {
    
}

class ChatDetailViewModel: BaseViewModel {
    
    weak var delegate: ChatDetailViewModelDelegate?
    var messageData: [MessagesData] = []
//    var messageType = MessageType.received
    func getData() {
        getMessagesData()
        delegate?.updateUI()
    }
    
    func getMessagesData() {
        messageData.append(MessagesData(message: "Lorem Ipsum is simply dummy text of the printing?", time: "06:34 pm", messageType: .sending, receivedMessage: "", receivedTime: ""))
        messageData.append(MessagesData(message: "", time: "", messageType: .received, receivedMessage: "Hello Jade", receivedTime: "05:11 pm"))
        messageData.append(MessagesData(message: "Hi", time: "", messageType: .sending, receivedMessage: "", receivedTime: ""))
        messageData.append(MessagesData(message: "Lorem Ipsum is simply text of the?", time: "05:11 pm", messageType: .sending, receivedMessage: "", receivedTime: ""))
        messageData.append(MessagesData(message: "", time: "", messageType: .received, receivedMessage: "Lorem Ipsum is simply text of the lorem poem.", receivedTime: "05:11 pm"))
    }
    
    func backTapped() {
        
    }
    
    func moreTapped() {
        
    }
    
    func attachmentTapped() {
        
    }
    
    func emojiTapped() {
        
    }
    
    func cameraTapped() {
        
    }
    
    func microphoneTapped() {
        
    }
}

extension ChatDetailViewModel: ChatDetailViewDataSource {
    var profileImage: String {
        return "image1"
    }
    
    var profileTitle: String {
        return "Jade Phan"
    }
    
    var status: String {
        return "Active now"
    }
    
    func numberOfSections(_ type: ViewType) -> Int {
        return 1
    }
    
    func numberOfRowsForSection(_ section: Int, type: ViewType) -> Int {
        return messageData.count
    }
    
    func sizeForItemAtIndex(_ indexPath: IndexPath, type: ViewType) -> CGSize {
        return CGSize(width: ScreenWidth, height: UITableView.automaticDimension)
    }
    
    func cardConfigForIndexPath(_ indexPath: IndexPath, type: ViewType) -> CardConfig {
        if messageData[indexPath.row].messageType == .sending {
            return CardType.sendingMessage.config()
        } else {
            return CardType.receivedMessage.config()
        }
    }
    
    func dataSourceForCellAtIndex(_ indexPath: IndexPath, type: ViewType) -> BaseCardCellDataSource {
        return messageData[indexPath.row]
    }
}

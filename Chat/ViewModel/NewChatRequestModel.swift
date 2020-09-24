//
//  NewChatRequestModel.swift
//  Chat
//
//  Created by narendra. vadde on 24/09/20.
//  Copyright © 2020 narendra. vadde. All rights reserved.
//

import Foundation
import UIKit

protocol NewChatRequestModelDelegate: BaseViewModelDelegate {
    
}

class NewChatRequestModel: BaseViewModel {
    
    weak var delegate: NewChatRequestModelDelegate?
    var chatData: [ChatData] = []
    
    func getData() {
        getChatData()
        delegate?.updateUI()
    }
    
    func getChatData() {
        chatData.append(ChatData(profileImage: "image1", profileName: "Rakesh Maurya", chatDescription: "Hello How are you?", chatTime: "05:11 pm", messagesCount: "3", muteStatus: false, onlineStatus: false))
        chatData.append(ChatData(profileImage: "image2", profileName: "Jade Phan", chatDescription: "Hello", chatTime: "16 Apr", messagesCount: "", muteStatus: true, onlineStatus: false))
        chatData.append(ChatData(profileImage: "image3", profileName: "Ashutosh Pandey", chatDescription: "Hello How are you?", chatTime: "24/04/2018", messagesCount: "", muteStatus: false, onlineStatus: true))
        chatData.append(ChatData(profileImage: "image1", profileName: "Rakesh Maurya", chatDescription: "Hello How are you?", chatTime: "05:11 pm", messagesCount: "", muteStatus: false, onlineStatus: false))
    }
    
    func searchTapped() {
        
    }
    
    func zNotificationTapped() {
        
    }
    
    func moreTapped() {
        
    }
    
}
//
//extension NewChatRequestModel: NewChatRequestViewDataSource {
//    var zNotificationCount: String {
//        <#code#>
//    }
//
//    func numberOfSections(_ type: ViewType) -> Int {
//        <#code#>
//    }
//
//    func numberOfRowsForSection(_ section: Int, type: ViewType) -> Int {
//        <#code#>
//    }
//
//    func sizeForItemAtIndex(_ indexPath: IndexPath, type: ViewType) -> CGSize {
//        <#code#>
//    }
//
//    func cardConfigForIndexPath(_ indexPath: IndexPath, type: ViewType) -> CardConfig {
//        <#code#>
//    }
//
//    func dataSourceForCellAtIndex(_ indexPath: IndexPath, type: ViewType) -> BaseCardCellDataSource {
//        <#code#>
//    }
//
//
//}

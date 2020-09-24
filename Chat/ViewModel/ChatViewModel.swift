//
//  ChatViewModel.swift
//  Mobile-ZeeMusic
//
//  Created by narendra. vadde on 16/09/20.
//  Copyright © 2020 narendra. vadde. All rights reserved.
//

import Foundation
import UIKit

protocol ChatViewModelDelegate: BaseViewModelDelegate {
    func stateGotUpdated()
}

class ChatViewModel: BaseViewModel {
    
    weak var delegate: ChatViewModelDelegate?
    var profileData: [ChatProfileData] = []
    var chatData: [ChatData] = []
    
    var isHome = false
    var isNews = false
    var isPost = false
    var isChat = true
    var isExplore = false
    
    func getData() {
        getProfileData()
        getChatData()
        delegate?.updateUI()
    }
    
    func getProfileData() {
        profileData.append(ChatProfileData(image: "image1", profileName: "Ankush", status: true))
        profileData.append(ChatProfileData(image: "image5", profileName: "Deepanshu", status: true))
        profileData.append(ChatProfileData(image: "image7", profileName: "Nikita", status: true))
        profileData.append(ChatProfileData(image: "image9", profileName: "Deepthi", status: true))
        profileData.append(ChatProfileData(image: "image4", profileName: "Rahul", status: true))
    }
    
    func getChatData() {
        chatData.append(ChatData(profileImage: "image1", profileName: "Rakesh Maurya", chatDescription: "Hello How are you?", chatTime: "05:11 pm", messagesCount: "3", muteStatus: false, onlineStatus: false))
        chatData.append(ChatData(profileImage: "image2", profileName: "Jade Phan", chatDescription: "Hello", chatTime: "16 Apr", messagesCount: "", muteStatus: true, onlineStatus: false))
        chatData.append(ChatData(profileImage: "image3", profileName: "Ashutosh Pandey", chatDescription: "Hello How are you?", chatTime: "24/04/2018", messagesCount: "", muteStatus: false, onlineStatus: true))
        chatData.append(ChatData(profileImage: "image1", profileName: "Rakesh Maurya", chatDescription: "Hello How are you?", chatTime: "05:11 pm", messagesCount: "", muteStatus: false, onlineStatus: false))
    }
    
    func searchTapped() {
        delegate?.push(Controller.search.getViewController())
    }
    
    func zNotificationTapped() {
        
    }
    
    func moreTapped() {
        
    }
    
    func homeTapped() {
        
    }
    
    func newsTapped() {
        
    }
    
    func postTapped() {
        
    }
    
    func chatTapped() {
        
    }
    
    func exploreTapped() {
        
    }
    
    func selectedChatDetails(source: BaseTableViewCellDataSource?) {
        delegate?.push(Controller.chatDetails.getViewController())
    }
    
    func helpTapped() {
        
    }
    
    func chatNotificationTapped() {
        delegate?.push(Controller.newChatRequest.getViewController())
    }
}

extension ChatViewModel: ChatViewDataSource {
    var name: String {
        return "Rakesh Maurya"
    }
    
    var zNotificationsCount: String {
        return "50"
    }
    
    var chatNotificationCount: String {
        return "3"
    }
    
    var homeLabelColor: UIColor {
        return isHome ? Config.shared.colors.chatBackgroundColor1 : Config.shared.colors.chatTextColor3
    }
    
    var newsLabelColor: UIColor {
        return isNews ? Config.shared.colors.chatBackgroundColor1 : Config.shared.colors.chatTextColor3
    }
    
    var postLabelColor: UIColor {
        return isPost ? Config.shared.colors.chatBackgroundColor1 : Config.shared.colors.chatTextColor3
    }
    
    var chatLabelColor: UIColor {
        return isChat ? Config.shared.colors.chatBackgroundColor1 : Config.shared.colors.chatTextColor3
    }
    
    var exploreLabelColor: UIColor {
        return isExplore ? Config.shared.colors.chatBackgroundColor1 : Config.shared.colors.chatTextColor3
    }
    
    func numberOfSections(_ type: ViewType) -> Int {
        return 1
    }
    
    func numberOfRowsForSection(_ section: Int, type: ViewType) -> Int {
        if type == .collectionView {
            return profileData.count
        } else {
            return chatData.count
        }
    }
    
    func sizeForItemAtIndex(_ indexPath: IndexPath, type: ViewType) -> CGSize {
        if type == .collectionView {
            return CGSize(width: 80, height: 80)
        } else {
            return CGSize(width: ScreenWidth, height: 80)
        }
    }
    
    func cardConfigForIndexPath(_ indexPath: IndexPath, type: ViewType) -> CardConfig {
        if type == .collectionView {
            return CardType.chatProfile.config()
        } else {
            return CardType.chatMessages.config()
        }
    }
    
    func dataSourceForCellAtIndex(_ indexPath: IndexPath, type: ViewType) -> BaseCardCellDataSource {
        if type == .collectionView {
            return profileData[indexPath.row]
        } else {
            return chatData[indexPath.row]
        }
    }
}

extension ChatViewModel: NewChatRequestViewDataSource {
    var zNotificationCount: String {
        return "100"
    }
}

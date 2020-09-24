//
//  SearchViewModel.swift
//  Chat
//
//  Created by narendra. vadde on 23/09/20.
//  Copyright © 2020 narendra. vadde. All rights reserved.
//

import Foundation
import UIKit

enum State {
    case chatSearch
    case search
    
    func showViews() -> (chatSearch: Bool, search: Bool) {
        switch self {
        case .chatSearch:
            return (chatSearch: true, search: false)
        case .search:
            return (chatSearch: false, search: true)
        }
    }
}

protocol SearchViewModelDelegate: BaseViewModelDelegate {
    
}

class SearchViewModel: BaseViewModel {
    
    weak var delegate: SearchViewModelDelegate?
    var currentState = State.search
    var chatData: [ChatData] = []
    var chatCard: ChatCardSection = ChatCardSection()
    
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
    
    func backTapped() {
        delegate?.popTheController()
    }
    
    func chatSearchCancelTapped() {
        
    }
    
    func searchCancelTapped() {
        backTapped()
    }
    
    func showViews() -> (chatSearch: Bool, search: Bool) {
        return currentState.showViews()
    }
    
    func chatSearchTextFieldTextDidChange(text: String) {
        chatCard.updateFilterRows(text: text)
        delegate?.updateUI()
    }
    
    func searchTextFieldTextDidChange(text: String) {
        chatCard.updateFilterRows(text: text)
        delegate?.updateUI()
    }
}

extension SearchViewModel: ChatSearchViewDataSource {
    func numberOfSections(_ type: ViewType) -> Int {
        return 1
    }
    
    func numberOfRowsForSection(_ section: Int, type: ViewType) -> Int {
        return chatData.count
    }
    
    func sizeForItemAtIndex(_ indexPath: IndexPath, type: ViewType) -> CGSize {
        return CGSize(width: ScreenWidth, height: 80)
    }
    
    func cardConfigForIndexPath(_ indexPath: IndexPath, type: ViewType) -> CardConfig {
        return CardType.chatMessages.config()
    }
    
    func dataSourceForCellAtIndex(_ indexPath: IndexPath, type: ViewType) -> BaseCardCellDataSource {
        return chatData[indexPath.row]
    }
}

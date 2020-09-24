//
//  Chat.swift
//  Mobile-ZeeMusic
//
//  Created by narendra. vadde on 18/09/20.
//  Copyright © 2020 narendra. vadde. All rights reserved.
//

import Foundation
import UIKit

class ChatProfileData {
    var profileImage: String?
    var profileName: String?
    var status: Bool?
    
    init (image: String?, profileName: String?, status: Bool?){
        self.profileImage = image
        self.profileName = profileName
        self.status = status
    }
}

extension ChatProfileData: VerticalImageLabelCellDataSource {
    var isOnline: Bool {
        return status ?? false
    }
    
    var image: String {
        return profileImage ?? ""
    }
    
    var title: String {
        return profileName ?? ""
    }
}

class ChatData {
    var profileImage: String?
    var profileName: String?
    var chatDescription: String?
    var chatTime: String?
    var messagesCount: String?
    var muteStatus: Bool?
    var onlineStatus: Bool?
    
    init(profileImage: String?, profileName: String?, chatDescription: String?, chatTime: String?, messagesCount: String?, muteStatus: Bool?, onlineStatus: Bool?) {
        self.profileImage = profileImage
        self.profileName = profileName
        self.chatDescription = chatDescription
        self.chatTime = chatTime
        self.messagesCount = messagesCount
        self.muteStatus = muteStatus
        self.onlineStatus = onlineStatus
    }
}

extension ChatData: ImageHorizontalLabelsCellDataSource {
    var image: String {
        return profileImage ?? ""
    }
    
    var title: String {
        return profileName ?? ""
    }
    
    var description: String {
        return chatDescription ?? ""
    }
    
    var time: String {
        return chatTime ?? ""
    }
    
    var count: String {
        return messagesCount ?? ""
    }
    
    var isMute: Bool {
        return muteStatus ?? false
    }
    
    var isOnline: Bool {
        return onlineStatus ?? false
    }
}

class ChatCardSection {
    var rows: [ChatData] =  [] {
        didSet{
            filterRows = rows
        }
    }
    var filterRows: [ChatData] = []
    
    func updateFilterRows(text: String) {
        if (text != "") {
            filterRows = rows.filter { (data) -> Bool in
                return (data.title).lowercased().contains(text.lowercased())
            }
        }
        else {
            filterRows = rows
        }
    }
}


//
//  Messages.swift
//  Chat
//
//  Created by narendra. vadde on 21/09/20.
//  Copyright © 2020 narendra. vadde. All rights reserved.
//

import Foundation
import UIKit

enum MessageType {
    case sending
    case received
}

class MessagesData {
    var sentMessage: String?
    var SendingTime: String?
    var messageType: MessageType?
    var receivedMessage: String?
    var receivedTime: String?
    
    init(message: String?, time: String?, messageType: MessageType?, receivedMessage: String?, receivedTime: String?) {
        self.sentMessage = message
        self.SendingTime = time
        self.messageType = messageType
        self.receivedMessage = receivedMessage
        self.receivedTime = receivedTime
    }
}

extension MessagesData: SenderCellDataSource {
    var sendingMessage: String {
        return sentMessage ?? ""
    }
    
    var sentTime: String {
        return SendingTime ?? ""
    }
}

extension MessagesData: ReceiverCellDataSource {
    var message: String {
        return receivedMessage ?? ""
    }
    
    var time: String {
        return receivedTime ?? ""
    }
}


//class SendingMessages {
//    var sentMessage: String?
//    var sendingTime: String?
//    var messageType: MessageType?
//
//    init(sendingMessage: String?, sendingTime: String?, messageType: MessageType?) {
//        self.sentMessage = sendingMessage
//        self.sendingTime = sendingTime
//        self.messageType = messageType
//    }
//}
//
//extension SendingMessages: SenderCellDataSource {
//    var sendingMessage: String {
//        return sentMessage ?? ""
//    }
//
//    var sentTime: String {
//        return sendingTime ?? ""
//    }
//}
//
//
//class ReceivingMessages {
//    var receivedMessage: String?
//    var receivedTime: String?
//    var messageType: MessageType?
//
//    init(receivedMessage: String?, receivedTime: String?, messageType: MessageType?) {
//        self.receivedMessage = receivedMessage
//        self.receivedTime = receivedTime
//        self.messageType = messageType
//    }
//}
//
//extension ReceivingMessages: ReceiverCellDataSource {
//    var message: String {
//        return receivedMessage ?? ""
//    }
//
//    var time: String {
//        return receivedTime ?? ""
//    }
//}

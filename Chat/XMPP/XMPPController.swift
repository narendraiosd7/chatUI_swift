//
//  XMPPController.swift
//  Chat
//
//  Created by narendra. vadde on 19/09/20.
//  Copyright © 2020 narendra. vadde. All rights reserved.
//

import UIKit
import XMPPFramework

enum XMPPControllerError: Error {
    case wrongUserJID
}

class XMPPController: NSObject {
    var xmppStream: XMPPStream?
    
    var hostName: String?
    var userJID: XMPPJID?
    var hostPort: UInt16?
    var password: String?
    
    init(hostName: String?, userJID: String?, hostPort:UInt16 = 5222, password: String?) throws {
        guard let userJID = XMPPJID(string: userJID ?? "") else {
            throw XMPPControllerError.wrongUserJID
        }
       
        self.hostName = hostName
        self.userJID = userJID
        self.hostPort = hostPort
        self.password = password
        
        self.xmppStream = XMPPStream()
        self.xmppStream?.hostName = hostName
        self.xmppStream?.hostPort = hostPort
        self.xmppStream?.startTLSPolicy = XMPPStreamStartTLSPolicy.allowed
        self.xmppStream?.myJID = userJID
        
        super.init()
        
        self.xmppStream?.addDelegate(self, delegateQueue: DispatchQueue.main)
    }
    
    func connet() {
        if !(self.xmppStream?.isDisconnected ?? true) {
            return
        }
        
        try! self.xmppStream?.connect(withTimeout: XMPPStreamTimeoutNone)
    }
}

extension XMPPController: XMPPStreamDelegate {
    func xmppStreamDidConnect(_ sender: XMPPStream) {
        print("Stream is connected")
        try! xmppStream?.authenticate(withPassword: self.password ?? "")
    }
    
    func xmppStreamDidAuthenticate(_ sender: XMPPStream) {
        self.xmppStream?.send(XMPPPresence())
        print("Stream Authenticated")
    }
    
    func xmppStream(_ sender: XMPPStream, didNotAuthenticate error: DDXMLElement) {
        print("Stream: Fail to Authenticate")
    }
}

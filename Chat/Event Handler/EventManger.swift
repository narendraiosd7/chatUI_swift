//
//  EventManger.swift
//  Talkies
//
//  Created by santhoshkumar nampally on 08/04/20.
//  Copyright © 2020 santhoshkumar nampally. All rights reserved.
//

import Foundation

class EventManager {
    static func updateEvent(id: String, data: Any?) {
        EventUpdate.newEvent(id: id, data: data)
    }
    
    static func updateScreenEvent(id: String, state:ScreenEvent) {
        let time =  String(describing: Date())
        let data = ["id":id,"time":time,"state":state.rawValue]
        EventUpdate.newEvent(id: "screenFlowEvent", data: data)
    }
}


fileprivate class EventUpdate {
    // server communication and offline storage
    
    static func newEvent(id:String, data: Any?) {
        
    }
    
    static func sendEvent() {
        
    }
}

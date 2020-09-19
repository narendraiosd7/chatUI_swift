//
//  EventBaseView.swift
//  Talkies
//
//  Created by santhoshkumar nampally on 08/04/20.
//  Copyright © 2020 santhoshkumar nampally. All rights reserved.
//

import UIKit
import AVKit

enum VideoState: String {
    case play = "Play"
    case pause = "Pause"
}

class VideoPlayer: AVPlayer{
    
    override init() {
        super.init()
        registerForNotification()
    }
    
    override init(url URL: URL) {
        super.init(url: URL)
        registerForNotification()
    }
    
    override init(playerItem item: AVPlayerItem?) {
        super.init(playerItem: item)
        registerForNotification()
    }
    
    func registerForNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(playerState), name: .AVPlayerItemTimeJumped, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(playerState), name: .AVPlayerItemDidPlayToEndTime, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(playerState), name: .AVPlayerItemFailedToPlayToEndTime, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(playerState), name: .AVPlayerItemPlaybackStalled, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(playerState), name: .AVPlayerItemNewAccessLogEntry, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(playerState), name: .AVPlayerItemNewErrorLogEntry, object: nil)
    }
    
    override func play() {
        super.play()
        EventManager.updateEvent(id: "play", data: ["url":currentItem?.asset])
    }
    
    override func pause() {
        super.pause()
        EventManager.updateEvent(id: "play", data: ["url":currentItem?.asset])
    }
    
    @objc func playerState(note: NSNotification) {
        EventManager.updateEvent(id: "videoStatus", data: ["url": String(describing: currentItem?.asset), "state":note.name])
    }
}

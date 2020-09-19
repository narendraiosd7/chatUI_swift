//
//  NotificationCenterAdapter.swift
//  XMS
//
//  Created by santhoshkumar nampally on 02/04/20.
//  Copyright © 2020 santhoshkumar nampally. All rights reserved.
//

import Foundation
import UserNotifications
import UIKit
import Messages

let xmsNotification: NotificationCenterAdapter = NotificationCenterAdapter()

extension Notification.Name {
    static let reloadScreen = Notification.Name("ReloadScreen")
}

enum NotificationType: String {
    case unknown = "unknown"
    case refreshData = "refreshData"
    case languageGotUpdated = "languageGotUpdated"
    case loggedOut = "loggedOut"
    case deeplinkUpdated = "deeplinkUpdated"
    case profilePicUpdate = "profilePicUpdate"
    case userName = "userName"
    case reloadVideoList = "reloadVideoList"
    case loginSuccessful = "loginSuccessful"
    case followingUpdated = "followingUpdated"
    case willResignActive = "willResignActive"
    case videoGotDeleted = "videoGotDeleted"
    case didEnterBackground = "didEnterBackground"
    case didEnterForeground = "didEnterForeground"
    case selectedAudio = "selectedAudio"
    case videoRecordingCompleted = "videoRecordingCompleted"
    case gallerySelcted = "gallerySelcted"
}

class NotificationCenterAdapter: NSObject {
    
    let typeKey = "notificationType"
    let eventKey = "event"

    fileprivate override init() {
        
    }
    
    func postNotification(info: [String:Any]) {
        var info = info
        info[typeKey] = NotificationType.init(rawValue: info[eventKey] as? String ?? "") ?? NotificationType.unknown
        NotificationCenter.default.post(name: .reloadScreen, object: info)
    }
    
    func requestForNotificationPermission() {

        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
            (granted, error) in
            print("Permission granted: \(granted)")
            // 1. Check if permission granted
            guard granted else { return }
            // 2. Attempt registration for remote notifications on the main thread
            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
    }
}

extension NotificationCenterAdapter : UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        if let userInfo = notification.request.content.userInfo as? [String:Any] {
            postNotification(info: userInfo)
        }
        completionHandler([])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        if let userInfo =  response.notification.request.content.userInfo as? [String:Any] {
            postNotification(info: userInfo)
        }
        completionHandler()
    }
}

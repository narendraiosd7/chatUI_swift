//
//  LocalNotificationAdapter.swift
//  Talkies
//
//  Created by santhoshkumar nampally on 23/03/20.
//  Copyright © 2020 santhoshkumar nampally. All rights reserved.
//

import Foundation
import UserNotifications

class LocalNotificationAdapter {

    static func scheduleNotification(title: String, message: String, time: Date,  uniqueID: String) {
        let center = UNUserNotificationCenter.current()
        let content  = UNMutableNotificationContent()
        
        content.title = title
        content.body = message
        content.sound = .default
        
        if time.timeIntervalSinceNow > 0 {
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time.timeIntervalSinceNow, repeats: false)
            let request = UNNotificationRequest(identifier: "LocalNotificationIdentifier", content: content, trigger: trigger)
            print("Local notificationssss!!!")
            center.add(request) { (error) in
                if error != nil {
                    print("error \(String(describing: error))")
                }
            }
            self.saveToPlist(uniqueID, time)
        }
    }
    
    static func checkForScheduleNotification(checkTime: Date, uniqueID: String) -> Bool {
        
        let dic = readFromPlist()
        if let data = dic["data"] as? [[String:Any]] {
            for each in data {
                if (each["id"] as? String == uniqueID && each["time"] as? Date == checkTime) {
                    return true
                }
            }
        }
        
        return false
    }
    
    static func saveToPlist(_ id:String, _ time: Date) {
        let docsBaseURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let localNotificationPlistURL = docsBaseURL.appendingPathComponent("localNotification.plist")
        print(localNotificationPlistURL.absoluteString)
        var dic = readFromPlist()
        if var data = dic["data"] as? [[String:Any]] {
            dic["data"] = data.append(["id":id,"time":time])
        }
        else {
            dic["data"] = [["id":id,"time":time]]
        }
        
        do  {
            let data = try PropertyListSerialization.data(fromPropertyList: dic, format: PropertyListSerialization.PropertyListFormat.binary, options: 0)
            do {
                try data.write(to: localNotificationPlistURL, options: .atomic)
                print("Successfully write")
            }catch (let err){
                print(err.localizedDescription)
            }
        }  catch (let err){
            print(err.localizedDescription)
        }
    }
    
    
    static func readFromPlist() -> [String: Any] {
        //Read the data from the plist file to check if it is registered for local notifications
        var plistData: NSDictionary?
        if let path = Bundle.main.path(forResource: "localNotification", ofType: "plist") {
            plistData = NSDictionary(contentsOfFile: path)
        }
        return plistData as? [String: Any] ?? [:]
    }
    
}

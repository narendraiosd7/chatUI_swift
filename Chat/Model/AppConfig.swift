//
//  AppConfig.swift
//  Talkies
//
//  Created by santhoshkumar nampally on 23/03/20.
//  Copyright © 2020 santhoshkumar nampally. All rights reserved.
//

import Foundation

class AppConfig
{
    static func getAppConfig(data: @escaping (([String:Any]) -> Void))
    {
        AppConfigServiceLayer.getConfig { (response) in
            data(response)
        }
    }
}

class AppConfigModel: Codable {
    let forceUpdate, suggestedUpdate, updateMessage, appstoreURL: String?
    let isBeta: Bool?
    let baseURL, chatURL: String?

    enum CodingKeys: String, CodingKey {
        case forceUpdate, suggestedUpdate, updateMessage
        case appstoreURL = "appstoreUrl"
        case isBeta
        case baseURL = "baseUrl"
        case chatURL = "chatUrl"
    }
}

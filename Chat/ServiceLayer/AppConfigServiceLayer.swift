//
//  AppConfigServiceLayer.swift
//  Talkies
//
//  Created by santhoshkumar nampally on 23/03/20.
//  Copyright © 2020 santhoshkumar nampally. All rights reserved.
//

import Foundation

class AppConfigServiceLayer:BaseServiceLayer
{
    static func getConfig(result: @escaping ((([String:Any]) -> Void)))
    {
        NetworkAdaptor.request(urlStr: API.config.url(), method: .get, parameters: [:], headers: [:]) { (response) in
            result(response)
        }
    }
}

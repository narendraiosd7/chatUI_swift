//
//  RequestCacheLayer.swift
//  Talkies
//
//  Created by santhoshkumar nampally on 23/03/20.
//  Copyright © 2020 santhoshkumar nampally. All rights reserved.
//

import Foundation

class CacheLayer {
    static let shared = CacheLayer()
    
    func getCacheFor(key: String) -> Data? {
        return UserDefaults.standard.data(forKey: key)
    }
    
    func saveCacheFor(key: String, data:Data) {
        UserDefaults.standard.set(data, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    func deleteCacheFor(key: String) {
        UserDefaults.standard.set(nil, forKey: key)
        UserDefaults.standard.synchronize()
    }
}

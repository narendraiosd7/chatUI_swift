//
//  ContentServiceLayer.swift
//  Bid2Win
//
//  Created by santhoshkumar nampally on 09/12/19.
//  Copyright © 2019 santhoshkumar nampally. All rights reserved.
//

import Foundation

enum ContentType{
    case faq
    case content
}

protocol ContentServiceLayerDelegate: class {
    func reponse(_ data:[String:Any], type: ContentType)
}

class ContentServiceLayer {
    
    weak var delegate:ContentServiceLayerDelegate?
    
//    func getFAQ() {
//
//        let parameters:[String:Any] = [:]
//
//        NetworkAdaptor.request(urlStr: API.faq.url(), method: .get, parameters: parameters, headers: [:]) { [weak self](data) in
//            self?.delegate?.reponse(data, type: .faq)
//        }
//    }
    
    func getContent(url: String) {
        
        let parameters:[String:Any] = [:]
    
        NetworkAdaptor.request(urlStr: url, method: .get, parameters: parameters, headers: [:]) { [weak self](data) in
            self?.delegate?.reponse(data, type: .content)
        }
    }
    
//    func getOnBoarding() {
//        let parameters:[String:Any] = [:]
//
//        NetworkAdaptor.request(urlStr: API.onboarding.url(), method: .get, parameters: parameters, headers: [:]) { [weak self](data) in
//            self?.delegate?.reponse(data, type: .content)
//        }
//    }
}

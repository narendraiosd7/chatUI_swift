//
//  NetworkAdaptor.swift
//  Talkies
//
//  Created by santhoshkumar nampally on 23/03/20.
//  Copyright © 2020 santhoshkumar nampally. All rights reserved.
//

import Foundation
import Alamofire

var config: AppConfigModel?

enum ResponseStatus {
    case notADic
    case dataDoesNotExists
    case errorInJsonParsing
    case errorInUrlParsing
    case noInternetConnection
    case success
    case unAbleToFetchLocatiomn
    
    static func keyForResponseStatus() -> String {
        return "responseStatus"
    }
    
    func showErrorView() -> (String,Bool) {
        switch self {
        case .success:
            return ("Unable to load. Please try again.", false)
        case .noInternetConnection:
            return ("No internet connection", true)
        case .errorInJsonParsing:
            return ("Content is not available.", true)
        case .unAbleToFetchLocatiomn:
            return ("Unable to access Location", true)
        default:
            return ("Unable to load.", true)
        }
    }
}

class Connectivity {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}

class NetworkAdaptor {
    static func request(urlStr:String, method:HTTPMethod, parameters: [String:Any], headers: HTTPHeaders? = nil, encoding: ParameterEncoding = URLEncoding.default,cacheResponse: Bool? = nil, completionHandler:@escaping (([String: Any])->Void)) {
        do{
            let headers = headers
            
            let parameters = parameters
            
            let request = AF.request(try urlStr.asURL(), method: method, parameters: parameters, encoding: encoding, headers: headers)

            if((cacheResponse ?? false) || method == .get) {
                if let data = cachedResponseForKey(request.request?.url?.absoluteString ?? "", status: ResponseStatus.success){
                    completionHandler(data)
                    if ((data[ResponseStatus.keyForResponseStatus()] as? ResponseStatus) ?? ResponseStatus.success) == ResponseStatus.noInternetConnection{
                        return
                    }
                }
            }
            
            request.responseJSON { (response) in
                do {
                    if let data = response.data {
                        let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                        if var json = json as? [String:Any] {
                            json[ResponseStatus.keyForResponseStatus()] = ResponseStatus.success
                            CacheLayer.shared.saveCacheFor(key: response.request?.url?.absoluteString ?? "", data: data)
                            completionHandler(json)
                        }
                        else {
                            completionHandler(cachedResponseForKey(response.request?.url?.absoluteString ?? "", status: ResponseStatus.notADic) ?? [:])
                        }
                    }
                    else {
                        completionHandler(cachedResponseForKey(response.request?.url?.absoluteString ?? "", status: ResponseStatus.dataDoesNotExists) ?? [:])
                    }
                }
                catch {
                    completionHandler(cachedResponseForKey(response.request?.url?.absoluteString ?? "", status: ResponseStatus.errorInJsonParsing) ?? [:])
                }
            }
        }
        catch{
            completionHandler([ResponseStatus.keyForResponseStatus():ResponseStatus.errorInUrlParsing])
        }
    }
    
    static func requestForNonJsonResponse (urlStr:String, method:HTTPMethod, parameters: [String:Any], headers: HTTPHeaders? = nil, encoding: ParameterEncoding = URLEncoding.default,cacheResponse: Bool? = nil, completionHandler:@escaping ((Data?)->Void)) {
        do{
            let request = AF.request(try urlStr.asURL(), method: method, parameters: parameters, encoding: encoding, headers: headers)
            request.response { (data) in
                completionHandler(data.data)
            }
        }
        catch {
            completionHandler(nil)
        }

    }
    
    static func cachedResponseForKey(_ key: String, status: ResponseStatus) -> [String:Any]?{
        do{
            if let data = CacheLayer.shared.getCacheFor(key:key){
                let json = try JSONSerialization.jsonObject(with:  data, options: .allowFragments)
                if var json = json as? [String:Any] {
                    if !Connectivity.isConnectedToInternet {
                        json[ResponseStatus.keyForResponseStatus()] = ResponseStatus.noInternetConnection
                        return json
                    }
                    else{
                        json[ResponseStatus.keyForResponseStatus()] = status
                        return json
                    }
                }
            }
        }catch {
            
        }
        
        if !Connectivity.isConnectedToInternet {
            return [ResponseStatus.keyForResponseStatus():ResponseStatus.noInternetConnection]
        }
        else{
            return nil
        }
    }
}

extension NetworkAdaptor
{
    static func Upload(urlStr:String,data:Data,name:String, filename:String, headers: HTTPHeaders, completionHandler:@escaping (([String: Any])->Void))
    {
//        let headers = headers

//        AF.upload(multipartFormData: { (multiPartFormData) in
//            multiPartFormData.append(data, withName: name, fileName: filename, mimeType: "image/png")
//        }, usingThreshold: UInt64.init(), to: try! urlStr.asURL(), method: .put, headers: headers) { (encodingResponse) in
//            switch encodingResponse {
//                case .success(let request, _, _):
//                    request.responseJSON { (dataResponse) in
//
//                        if let data = dataResponse.data
//                        {
//                            let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments)
//                            if let dataDict = json as? [String:Any]
//                            {
//                               completionHandler(dataDict)
//                            }
//                        }
//                    }
//                case .failure(let encodingError):
//                    print(encodingError.localizedDescription)
//            }
//        }
    }
}

class BaseServiceLayer {
    var headers:[String:String] = [:]
}

enum Server: String{
    case prod = "1"
    case dev = "2"
    case qa = "3"
    
    static func getBaseUrl() -> String {
        return "https://rkgsgs3efd.execute-api.ap-south-1.amazonaws.com/prod/api/"
    }
}

enum API {
    case config
    case videoList
    case interest
    case languageList
    
    func url() -> String {
        let baseURL:String = Server.getBaseUrl()

        switch self {
        case .config:
            return ""
        case .videoList:
            return baseURL + "v1/list"
        case .interest:
            return baseURL + ""
        case .languageList:
            return baseURL + ""
        }
    }
}


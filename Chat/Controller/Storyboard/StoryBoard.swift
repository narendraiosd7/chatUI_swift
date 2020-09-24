//
//  StoryBoard.swift
//  Talkies
//
//  Created by santhoshkumar nampally on 23/03/20.
//  Copyright © 2020 santhoshkumar nampally. All rights reserved.
//

import Foundation
import UIKit

enum Controller {
    case loader
    case alert
    case noInternet
    case introduction
    case interest
    case language
    case discover
    case chat
    case chatDetails
    case actions
    case search
    
    func getViewController() -> UIViewController{
        
        var storyBoardId = ""
        var controllerId = ""
        
        switch self {
        case .loader:
            storyBoardId = "Main"
            controllerId = "LoaderViewController"
        case .alert:
            storyBoardId = "Main"
            controllerId = "AlertViewController"
        case .noInternet:
            storyBoardId = "Main"
            controllerId = "NoInternetViewController"
        case .introduction:
            storyBoardId = "OnBoarding"
            controllerId = "IntroductionViewController"
        case .interest:
            storyBoardId = "OnBoarding"
            controllerId = "InterestViewController"
        case .language:
            storyBoardId = "OnBoarding"
            controllerId = "LanguageViewController"
        case .discover:
            storyBoardId = "Discover"
            controllerId = "DiscoverViewController"
        case .chat:
            storyBoardId = "Home"
            controllerId = "ChatViewController"
        case .chatDetails:
            storyBoardId = "Home"
            controllerId = "ChatDetailsController"
        case .actions:
            storyBoardId = "Home"
            controllerId = "ActionsViewController"
        case .search:
            storyBoardId = "Home"
            controllerId = "SearchViewController"
        }
        
        let storyboard = UIStoryboard(name: storyBoardId, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: controllerId)
        return controller
    }
}

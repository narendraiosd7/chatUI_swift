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
    case album
    case moviesList
    case audioPlayer
    case albumDetails
    case recentlyPlayed
    case artist
    case profile
    case signUp
    case signin
    case forgetPassword
    case otp
    case chat
    
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
        case .album:
            storyBoardId = "Album"
            controllerId = "AlbumViewController"
        case .moviesList:
            storyBoardId = "Home"
            controllerId = "MoviesListViewController"
        case .audioPlayer:
            storyBoardId = "Home"
            controllerId = "PlayerViewController"
        case .albumDetails:
            storyBoardId = "Album"
            controllerId = "AlbumDetailViewController"
        case .recentlyPlayed:
            storyBoardId = "Home"
            controllerId = "RecentlyPlayedViewController"
        case .artist:
            storyBoardId = "Home"
            controllerId = "ArtistsViewController"
        case .profile:
            storyBoardId = "Profile"
            controllerId = "ProfileViewController"
        case .signUp:
            storyBoardId = "Profile"
            controllerId = "SignupViewController"
        case .signin:
            storyBoardId = "Profile"
            controllerId = "SigninViewController"
        case .forgetPassword:
            storyBoardId = "Profile"
            controllerId = "ForgetPasswordController"
        case .otp:
            storyBoardId = "Profile"
            controllerId = "OTPViewController"
        case .chat:
            storyBoardId = "Chat"
            controllerId = "ChatViewController"
        }
        
        let storyboard = UIStoryboard(name: storyBoardId, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: controllerId)
        return controller
    }
}

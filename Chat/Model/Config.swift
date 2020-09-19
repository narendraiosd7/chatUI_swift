//
//  Config.swift
//  Talkies
//
//  Created by santhoshkumar nampally on 23/03/20.
//  Copyright © 2020 santhoshkumar nampally. All rights reserved.
//

import UIKit
import Foundation

let ScreenWidth = UIScreen.main.bounds.width
let ScreenHeight = UIScreen.main.bounds.height
let isIpad = UIDevice.current.model.hasPrefix("iPad")

class Config {
    static let shared = Config()
    
    var strings: StaticData = StaticData()
    var fontStyles:Font = Font()
    var colors:Theme = Theme()
    var images:ImageNames = ImageNames()
    var keys:Key = Key()
    var firstTimeLoadKey = "firstTimeLoadKey"
    init() {
        
    }
    
    func updateStrings(_ translation:Translation) {
        strings = StaticData.init(translation: translation)
        xmsNotification.postNotification(info: [xmsNotification.eventKey:NotificationType.languageGotUpdated.rawValue])
    }
    
}

class Key {
    
}

class StaticData {
    var forceUpdateMessage = "Please update to the latest version from AppStore."
    var update = "Update"
    var suggestedUpdateMessage = "Please update to the latest version to enjoy the latest feature."
    var cancel = "Cancel"
    var enterValidMobile = "Please enter a valid mobile number"
    var ok = "OK"
    var invalidOTP = "Please enter valid OTP"
    var somethingWentWrong = "Something went wrong. Please try again."
    
    var finish = "Finish"
    var skip = "Skip"
    var languageTitle = "Select music languages"
    var languageSubtitle = "See music in these languages"
    var next = "Next"
    var interestTitle = "Choose your interests & get personalised music."
    var noNetworkConnection = "No network connection"
    var noNetworkConnectionSubtitle = "No internet connection. Connect to the internet and try again."
    var refresh = "Refresh"
    var discover = "Discover"
    var songsByMovie = "Songs By Movie"
    var moviesList = "Movies list"
    var nowPlaying = "Now Playing"
    var seeLyrics = "See Lyrics"
    var by = "By:"
    var synopsis = "Synopsis"
    var play = "Play"
    var profile = "Profile"
    var logout = "Logout"
    var edit = "Edit"
    var singUpTitle = "Sign Up for an account"
    var sigUpDescription = "By tapping “Accept & Sign Up”, you acknowledge that you have read the Privacy Policy and agree to Terms of Service."
    var signUpButtonTitle = "Accept & Sign Up"
    var loginButtonDesctiption = "Already have an account?"
    var login = "Log In"
    var or = "Or"
    var privacyPolicy = "Privacy Policy"
    var termsOfService = "Terms of Service."
    var confirmationCode = "Enter your confirmation code"
    var code = "CODE"
    var forgetPassword = "Forgot Password"
    var askNumber = "What’s your Mobile number?"
    var mobileNumber = "MOBILE NUMBER"
    var signin = "Signin"
    var emailID = "EMAIL ID"
    var password = "PASSWORD"
    
    init() {
        if let data = DocumentsAdapter.getData(path: DocumentPath.translation.rawValue){
            do{
                let translation = try JSONDecoder().decode(Translation.self, from: data)
                update(translation: translation)
            }
            catch{
                
            }
        }
    }
    
    init(translation: Translation) {
        storeData(translation)
        update(translation: translation)
    }
    
    func update(translation: Translation) {
        
    }
    
    func storeData(_ translation: Translation) {
        do{
            let data = try JSONEncoder().encode(translation)
            DocumentsAdapter.saveToFile(data, path: DocumentPath.translation.rawValue)
        }
        catch{
            
        }
    }
}

class Font {
    //...0 size 28
    //...1 size 18
    //...2 size 16
    //...2 size 14
    //...3 size 12
    
    let bold = UIFont.init(name: "ProximaNova-Medium", size: 28) ?? UIFont.systemFont(ofSize: 28, weight: .bold)
    let bold1 = UIFont.init(name: "ProximaNova-Medium", size: 18) ?? UIFont.systemFont(ofSize: 18, weight: .bold)
    let bold2 = UIFont.init(name: "ProximaNova-Medium", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .bold)
    let bold3 = UIFont.init(name: "ProximaNova-Medium", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .bold)
    let bold4 = UIFont.init(name: "ProximaNova-Medium", size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .bold)
    
    let medium1 = UIFont.init(name: "ProximaNova-Medium", size: 18) ?? UIFont.systemFont(ofSize: 18, weight: .medium)
    let medium2 = UIFont.init(name: "ProximaNova-Medium", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .medium)
    let medium3 = UIFont.init(name: "ProximaNova-Medium", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .medium)
    let medium4 = UIFont.init(name: "ProximaNova-Medium", size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .medium)
    let medium5 = UIFont.init(name: "ProximaNova-Medium", size: 10) ?? UIFont.systemFont(ofSize: 10, weight: .medium)
    let medium6 = UIFont.init(name: "ProximaNova-Medium", size: 8) ?? UIFont.systemFont(ofSize: 8, weight: .medium)
    
    let regular = UIFont.init(name: "ProximaNova-Regular", size: 24) ?? UIFont.systemFont(ofSize: 24, weight: .regular)
    let regular1 = UIFont.init(name: "ProximaNova-Regular", size: 18) ?? UIFont.systemFont(ofSize: 18, weight: .regular)
    let regular2 = UIFont.init(name: "ProximaNova-Regular", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .regular)
    let regular3 = UIFont.init(name: "ProximaNova-Regular", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .regular)
    let regular4 = UIFont.init(name: "ProximaNova-Regular", size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .regular)
    
    let boldMS = UIFont(name: "Montserrat-Bold", size: 28) ?? UIFont.systemFont(ofSize: 28, weight: .bold)
    let boldMS1 = UIFont(name: "Montserrat-Bold", size: 18) ?? UIFont.systemFont(ofSize: 18, weight: .bold)
    let boldMS2 = UIFont(name: "Montserrat-Bold", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .bold)
    let boldMS3 = UIFont(name: "Montserrat-Bold", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .bold)
    let boldMS4 = UIFont(name: "Montserrat-Bold", size: 12) ?? UIFont.systemFont(ofSize: 14, weight: .bold)
    
    let semiBoldMS = UIFont(name: "Montserrat-SemiBold", size: 20) ?? UIFont.systemFont(ofSize: 20, weight: .semibold)
    let semiBoldMS1 = UIFont(name: "Montserrat-SemiBold", size: 18) ?? UIFont.systemFont(ofSize: 18, weight: .semibold)
    let semiBoldMS2 = UIFont(name: "Montserrat-SemiBold", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .semibold)
    let semiBoldMS3 = UIFont(name: "Montserrat-SemiBold", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .semibold)
    let semiBoldMS4 = UIFont(name: "Montserrat-SemiBold", size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .semibold)
    
    let mediumMS = UIFont.init(name: "Montserrat-Medium", size: 24) ?? UIFont.systemFont(ofSize: 24, weight: .medium)
    let mediumMS20 = UIFont.init(name: "Montserrat-Medium", size: 20) ?? UIFont.systemFont(ofSize: 20, weight: .medium)
    let mediumMS1 = UIFont.init(name: "Montserrat-Medium", size: 18) ?? UIFont.systemFont(ofSize: 18, weight: .medium)
    let mediumMS2 = UIFont.init(name: "Montserrat-Medium", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .medium)
    let mediumMS3 = UIFont.init(name: "Montserrat-Medium", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .medium)
    let mediumMS4 = UIFont.init(name: "Montserrat-Medium", size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .medium)
    let mediumMS5 = UIFont.init(name: "Montserrat-Medium", size: 10) ?? UIFont.systemFont(ofSize: 10, weight: .medium)
    let mediumMS6 = UIFont.init(name: "Montserrat-Medium", size: 8) ?? UIFont.systemFont(ofSize: 8, weight: .medium)
    
    let extraLightMS = UIFont(name: "Montserrat-ExtraLight", size: 25) ??  UIFont.systemFont(ofSize: 25, weight: .ultraLight)
    let extraLightMS1 = UIFont.init(name: "Montserrat-ExtraLight", size: 18) ?? UIFont.systemFont(ofSize: 18, weight: .ultraLight)
    let extraLightMS2 = UIFont.init(name: "Montserrat-ExtraLight", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .ultraLight)
    let extraLightMS3 = UIFont.init(name: "Montserrat-ExtraLight", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .ultraLight)
    let extraLightMS4 = UIFont.init(name: "Montserrat-ExtraLight", size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .ultraLight)
    
    let lightMS1 = UIFont.init(name: "Montserrat-Light", size: 18) ?? UIFont.systemFont(ofSize: 18, weight: .light)
    let lightMS2 = UIFont.init(name: "Montserrat-Light", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .light)
    let lightMS3 = UIFont.init(name: "Montserrat-Light", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .light)
    let lightMS4 = UIFont.init(name: "Montserrat-Light", size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .light)
    let lightMS5 = UIFont.init(name: "Montserrat-Light", size: 10) ?? UIFont.systemFont(ofSize: 10, weight: .light)
    
    let regularMS = UIFont.init(name: "Montserrat-Regular", size: 25) ?? UIFont.systemFont(ofSize: 25, weight: .regular)
    let regularMS1 = UIFont.init(name: "Montserrat-Regular", size: 18) ?? UIFont.systemFont(ofSize: 18, weight: .regular)
    let regularMS2 = UIFont.init(name: "Montserrat-Regular", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .regular)
    let regularMS3 = UIFont.init(name: "Montserrat-Regular", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .regular)
    let regularMS4 = UIFont.init(name: "Montserrat-Regular", size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .regular)
    let regularMS5 = UIFont.init(name: "Montserrat-Regular", size: 10) ?? UIFont.systemFont(ofSize: 10, weight: .regular)
    let regularMS6 = UIFont.init(name: "Montserrat-Regular", size: 8) ?? UIFont.systemFont(ofSize: 8, weight: .regular)
    
    let boldOS = UIFont(name: "OpenSans-Bold", size: 28) ?? UIFont.systemFont(ofSize: 28, weight: .bold)
    let boldOS1 = UIFont(name: "OpenSans-Bold", size: 18) ?? UIFont.systemFont(ofSize: 18, weight: .bold)
    let boldOS2 = UIFont(name: "OpenSans-Bold", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .bold)
    let boldOS3 = UIFont(name: "OpenSans-Bold", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .bold)
    let boldOS4 = UIFont(name: "OpenSans-Bold", size: 12) ?? UIFont.systemFont(ofSize: 14, weight: .bold)
    
    let semiBoldOS1 = UIFont(name: "OpenSans-SemiBold", size: 18) ?? UIFont.systemFont(ofSize: 18, weight: .semibold)
    let semiBoldOS2 = UIFont(name: "OpenSans-SemiBold", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .semibold)
    let semiBoldOS3 = UIFont(name: "OpenSans-SemiBold", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .semibold)
    let semiBoldOS4 = UIFont(name: "OpenSans-SemiBold", size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .semibold)
    
    let regularOS1 = UIFont.init(name: "OpenSans-Regular", size: 18) ?? UIFont.systemFont(ofSize: 18, weight: .regular)
    let regularOS2 = UIFont.init(name: "OpenSans-Regular", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .regular)
    let regularOS3 = UIFont.init(name: "OpenSans-Regular", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .regular)
    let regularOS4 = UIFont.init(name: "OpenSans-Regular", size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .regular)
    
    
    //Chat Fonts:
    let avenirBlack = UIFont.init(name: "Avenir-Black", size: 24) ?? UIFont.systemFont(ofSize: 24, weight: .black)
    let avenirBlack1 = UIFont.init(name: "Avenir-Black", size: 18) ?? UIFont.systemFont(ofSize: 18, weight: .black)
    let avenirBlack2 = UIFont.init(name: "Avenir-Black", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .black)
    let avenirBlack3 = UIFont.init(name: "Avenir-Black", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .black)
    let avenirBlack4 = UIFont.init(name: "Avenir-Black", size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .black)
    
    let avenirBlack15 = UIFont.init(name: "Avenir-Black", size: 15) ?? UIFont.systemFont(ofSize: 15, weight: .black)
    
    let avenirBook = UIFont.init(name: "Avenir-Book", size: 24) ?? UIFont.systemFont(ofSize: 24, weight: .bold)
    let avenirBook1 = UIFont.init(name: "Avenir-Book", size: 18) ?? UIFont.systemFont(ofSize: 18, weight: .bold)
    let avenirBook2 = UIFont.init(name: "Avenir-Book", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .bold)
    let avenirBook3 = UIFont.init(name: "Avenir-Book", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .bold)
    let avenirBook4 = UIFont.init(name: "Avenir-Book", size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .bold)
    
    let avenirHeavy = UIFont.init(name: "Avenir-Heavy", size: 24) ?? UIFont.systemFont(ofSize: 24, weight: .heavy)
    let avenirHeavy1 = UIFont.init(name: "Avenir-Heavy", size: 18) ?? UIFont.systemFont(ofSize: 18, weight: .heavy)
    let avenirHeavy2 = UIFont.init(name: "Avenir-Heavy", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .heavy)
    let avenirHeavy3 = UIFont.init(name: "Avenir-Heavy", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .heavy)
    let avenirHeavy4 = UIFont.init(name: "Avenir-Heavy", size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .heavy)
    let avenirHeavy5 = UIFont.init(name: "Avenir-Heavy", size:  10) ?? UIFont.systemFont(ofSize: 10, weight: .heavy)
    let avenirHeavy6 = UIFont.init(name: "Avenir-Heavy", size: 8) ?? UIFont.systemFont(ofSize: 8, weight: .heavy)
    let avenirHeavy13 = UIFont.init(name: "Avenir-Heavy", size: 13) ?? UIFont.systemFont(ofSize: 13, weight: .heavy)
    
    let avenirLight = UIFont.init(name: "Avenir-Light", size: 24) ?? UIFont.systemFont(ofSize: 24, weight: .light)
    let avenirLight1 = UIFont.init(name: "Avenir-Light", size: 18) ?? UIFont.systemFont(ofSize: 18, weight: .light)
    let avenirLight2 = UIFont.init(name: "Avenir-Light", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .light)
    let avenirLight3 = UIFont.init(name: "Avenir-Light", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .light)
    let avenirLight4 = UIFont.init(name: "Avenir-Light", size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .light)
    
    let avenirMedium = UIFont.init(name: "Avenir-Medium", size: 24) ?? UIFont.systemFont(ofSize: 24, weight: .medium)
    let avenirMedium1 = UIFont.init(name: "Avenir-Medium", size: 18) ?? UIFont.systemFont(ofSize: 18, weight: .medium)
    let avenirMedium2 = UIFont.init(name: "Avenir-Medium", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .medium)
    let avenirMedium3 = UIFont.init(name: "Avenir-Medium", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .medium)
    let avenirMedium4 = UIFont.init(name: "Avenir-Medium", size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .medium)
    
    let avenirRoman = UIFont.init(name: "Avenir-Roman", size: 24) ?? UIFont.systemFont(ofSize: 24, weight: .regular)
    let avenirRoman1 = UIFont.init(name: "Avenir-Roman", size: 18) ?? UIFont.systemFont(ofSize: 18, weight: .regular)
    let avenirRoman2 = UIFont.init(name: "Avenir-Roman", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .regular)
    let avenirRoman3 = UIFont.init(name: "Avenir-Roman", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .regular)
    let avenirRoman4 = UIFont.init(name: "Avenir-Roman", size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .regular)
    
    let avenirRoman15 = UIFont.init(name: "Avenir-Roman", size: 15) ?? UIFont.systemFont(ofSize: 15, weight: .regular)
    
}

class Theme {
    
    var backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9215686275, blue: 0.9529411765, alpha: 1) //rgba(234, 235, 243, 1)
    var backgroundColor1 = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) //rgba(255, 255, 255, 1)
    var backgroundColor2 = #colorLiteral(red: 0.6705882353, green: 0.6862745098, blue: 0.8352941176, alpha: 1) //rgba(171, 175, 213, 1)
    var backgroundColor3 = #colorLiteral(red: 0.3294117647, green: 0.3764705882, blue: 0.4705882353, alpha: 1) //rgba(84, 96, 120, 1)
    var backgroundColor4 = #colorLiteral(red: 0.7803921569, green: 0.7921568627, blue: 0.8156862745, alpha: 1) //rgba(199, 202, 208, 1)
    var backgroundColor5 = #colorLiteral(red: 0.4392156863, green: 0.4941176471, blue: 0.5803921569, alpha: 1) //rgba(112, 126, 148, 1)
    var backgroundColor6 = #colorLiteral(red: 0.03921568627, green: 0.1882352941, blue: 0.4078431373, alpha: 1) //rgba(10, 48, 104, 1)
    var backgroundColor7 = #colorLiteral(red: 0.231372549, green: 0.3490196078, blue: 0.5960784314, alpha: 1) //rgba(59, 89, 152, 1)
    var backgroundColor8 = #colorLiteral(red: 0.7568627451, green: 0.7568627451, blue: 0.7568627451, alpha: 1) //rgba(193, 193, 193, 1)
    var backgroundColor9 = #colorLiteral(red: 0.2431372549, green: 0.2901960784, blue: 0.3490196078, alpha: 0.45) //rgba(62, 74, 89, 0.45)
    
    var textColor = #colorLiteral(red: 0.03921568627, green: 0.1882352941, blue: 0.4078431373, alpha: 1) //rgba(10, 48, 104, 1)
    var textColor1 = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) //rgba(255, 255, 255, 1)
    var textColor2 = #colorLiteral(red: 0.7803921569, green: 0.7921568627, blue: 0.8156862745, alpha: 1) //rgba(199, 202, 208, 1)
    var textColor3 = #colorLiteral(red: 0.3294117647, green: 0.3764705882, blue: 0.4705882353, alpha: 1) //rgba(84, 96, 120, 1)
    var textColor4 = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) //rgba(0, 0, 0, 1)
    var textColor5 = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.53) //rgba(255, 255, 255, 0.53)
    var textColor6 = #colorLiteral(red: 0.4392156863, green: 0.4941176471, blue: 0.5803921569, alpha: 1) //rgba(112, 126, 148, 1)
    var textColor7 = #colorLiteral(red: 0.03921568627, green: 0.1882352941, blue: 0.4078431373, alpha: 0.15) //rgba(10, 48, 104, 0.15)
    var textColor8 = #colorLiteral(red: 0.4941176471, green: 0.5176470588, blue: 0.5803921569, alpha: 1) //rgba(126, 132, 148, 1)
    var textColor9 = #colorLiteral(red: 0.1647058824, green: 0.2, blue: 0.2392156863, alpha: 1) //rgba(42, 51, 61, 1)
    var textColor10 = #colorLiteral(red: 0.7254901961, green: 0.7254901961, blue: 0.7254901961, alpha: 1) //rgba(185, 185, 185, 1)
    
    var cellTextColor = #colorLiteral(red: 0.6078431373, green: 0.6078431373, blue: 0.6078431373, alpha: 1) //rgba(155, 155, 155, 1)
    var cellTextColor1 = #colorLiteral(red: 0.1647058824, green: 0.2, blue: 0.2392156863, alpha: 1) //rgba(42, 51, 61, 1)
    
    var buttonTextColor = #colorLiteral(red: 0.4392156863, green: 0.4941176471, blue: 0.5803921569, alpha: 1) //rgba(112, 126, 148, 1)
    var buttonTextColor1 = #colorLiteral(red: 0.2431372549, green: 0.568627451, blue: 0.8745098039, alpha: 1) //rgba(62, 145, 223, 1)
    
    var borderColor = #colorLiteral(red: 0.7803921569, green: 0.7921568627, blue: 0.8156862745, alpha: 1) //rgba(199, 202, 208, 1)
    var borderColor1 = #colorLiteral(red: 0.9490196078, green: 0.9529411765, blue: 0.9647058824, alpha: 1) //rgba(242, 243, 246, 1)
    
    var gradientColor1 = #colorLiteral(red: 0.8117647059, green: 0.2235294118, blue: 0.7725490196, alpha: 1) //rgba(207, 57, 197, 1)
    var gradientColor2 = #colorLiteral(red: 0.3921568627, green: 0.2745098039, blue: 0.8901960784, alpha: 0.99) //rgba(100, 70, 227, 0.99)
    var gradientColor3 = #colorLiteral(red: 0.9450980392, green: 0.2235294118, blue: 0.6784313725, alpha: 0.98) //rgba(241, 57, 173, 0.98)
    
    var shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.16) //rgba(0, 0, 0, 0.16)
    var shadowColor1 = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.66) //rgba(255, 255, 255, 0.66)
    
    
    //chat Colors
    var chatBackgroundColor = #colorLiteral(red: 0.8470588235, green: 0.1294117647, blue: 0.1647058824, alpha: 1) //rgba(216, 33, 42, 1)
    var chatBackgroundColor1 = #colorLiteral(red: 0, green: 0.6509803922, blue: 0.3176470588, alpha: 1) //rgba(0, 166, 81, 1)
    var chatBackgroundColor2 = #colorLiteral(red: 1, green: 0.4705882353, blue: 0, alpha: 1) //rgba(255, 120, 0, 1)
    
    var chatTextColor = #colorLiteral(red: 0.1568627451, green: 0.1843137255, blue: 0.2431372549, alpha: 1) //rgba(40, 47, 62, 1)
    var chatTextColor1 = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) //rgba(255, 255, 255, 1)
    var chatTextColor2 = #colorLiteral(red: 0.1843137255, green: 0.1843137255, blue: 0.1843137255, alpha: 1) //rgba(47, 47, 47, 1)
    var chatTextColor3 = #colorLiteral(red: 0.5411764706, green: 0.568627451, blue: 0.6117647059, alpha: 1) //rgba(138, 145, 156, 1)
    
    
}

class ImageNames {
    var noNetwork = "lightNoNetwork"
    var searchGray = "searchGray"
    var play = "play"
    var back = "back"
    var playIcon = "playAll"
    var searchWhite = "searchWhite"
    var heartGray = "heartGray"
    var heartWhite = "heartWhite"
    var burgerMenu = "burgerMenu"
    var logout = "logout"
    var playlist = "playlist"
    var disk = "disk"
    var micphone = "micphone"
    var musicList = "musicList"
    var more = "more"
    var repeatTrack = "repeat"
    var shuffle = "shuffle"
    var previousTrack = "previousTrack"
    var nextTrack = "nextTrack"
    var heartSelected = "heartSelected"
    var musicBar = "musicBar"
    var next = "next"
    var search = "search"
    var heartUnselected = "heartUnselected"
    var musicListUnselect = "musicListUnselect"
    var musicListSelected = "musicListSelected"
    var loginBackground = "loginBackground"
    var zeeMusicLogo = "zeeMusicLogo"
    var user = "user"
    var google = "google"
    var facebook = "facebook"
    var warning = "warning"
    var cross = "cross"
    var hide = "hide"
    
    //chat images
    
    var chatExplore = "chatExplore"
    var chatMsgs =   "chatMsgs"
    var chat = "chat"
    var chat1 = "chat1"
    var chatHome = "chatHome"
    var chatMute = "chatMute"
    var chatNews = "chatNews"
    var chatSearch = "chatSearch"
    
}

class Translation: Codable {
    
}

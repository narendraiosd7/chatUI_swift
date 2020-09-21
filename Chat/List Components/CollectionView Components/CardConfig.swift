//
//  CardConfig.swift
//  Talkies
//
//  Created by santhoshkumar nampally on 23/03/20.
//  Copyright © 2020 santhoshkumar nampally. All rights reserved.
//

import Foundation

struct CardConfig {
    var nibName:String
    var bundle:Bundle?
    var reuseIdentifier:String
}


enum CardType: String {
    case introScreen = "introScreen"
    case languageCard = "languageCard"
    case interestCard = "RoundedLabel"
    case discoverCard = "discoverCard"
    case chatProfile = "chatProfile"
    case chatMessages = "chatMessages"
    case sendingMessage = "sendingMessage"
    case receivedMessage = "receivedMessage"
    
    func config() -> CardConfig {
        switch self {
        case .languageCard:
            return CardConfig(nibName: "VerticalLabelCell", bundle: Bundle.main, reuseIdentifier: "VerticalLabelCellCellIdentifier")
        case .interestCard:
            return CardConfig(nibName: "RoundedLabelCollectionViewCell", bundle: Bundle.main, reuseIdentifier: "RoundedLabelCollectionViewCellIdentifier")
        case .introScreen:
            return CardConfig(nibName: "ImageCollectionViewCell", bundle: Bundle.main, reuseIdentifier: "ImageCollectionViewCellIdentifier")
        case .discoverCard:
            return CardConfig(nibName: "DiscoverCollectionViewCell", bundle: Bundle.main, reuseIdentifier: "DiscoverCollectionViewCellIdentifier")
        case .chatProfile:
            return CardConfig(nibName: "VerticalImageLabelCell", bundle: Bundle.main, reuseIdentifier: "VerticalImageLabelCellIdentifier")
        case .chatMessages:
            return CardConfig(nibName: "ImageHorizontalLabelsCell", bundle: Bundle.main, reuseIdentifier: "ImageHorizontalLabelsCellIdentifier")
        case .sendingMessage:
            return CardConfig(nibName: "SenderCell", bundle: Bundle.main, reuseIdentifier: "SenderCellIdentifier")
        case .receivedMessage:
            return CardConfig(nibName: "ReceiverCell", bundle: Bundle.main, reuseIdentifier: "ReceiverCellIdentifier")
        }
    }
}

enum HeaderType: String {
    case label = "label"
    
    func config() -> CardConfig {
        switch self {
        case .label:
            return CardConfig(nibName: "LabelCollectionReusableView", bundle: Bundle.main, reuseIdentifier: "LabelCollectionReusableViewIdentifier")
        }
    }
}

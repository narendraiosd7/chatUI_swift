//
//  AlertViewController.swift
//  Talkies
//
//  Created by santhoshkumar nampally on 23/03/20.
//  Copyright © 2020 santhoshkumar nampally. All rights reserved.
//

import UIKit

enum AlertType {
    case timesUp
    case forceUpdate
    case suggestedUpdate
    case enterValidMobile
    case invalidOTP
    case somethingWentWrong

    
    func getData() -> AlertData {
        switch self {
        case .timesUp:
            return AlertData.init(title: "", message: "", imageName: nil, mainButtonTitle: "", destructiveButtonTitle: nil)
        case .forceUpdate:
            return AlertData.init(title: "", message: Config.shared.strings.forceUpdateMessage, imageName: nil, mainButtonTitle: Config.shared.strings.update, destructiveButtonTitle: nil)
        case .suggestedUpdate:
            return AlertData.init(title: "", message: Config.shared.strings.suggestedUpdateMessage, imageName: nil, mainButtonTitle: Config.shared.strings.update, destructiveButtonTitle: Config.shared.strings.cancel)
        case .enterValidMobile:
            return AlertData.init(title: "", message: Config.shared.strings.enterValidMobile, imageName: nil, mainButtonTitle: Config.shared.strings.ok, destructiveButtonTitle: nil)
        case .invalidOTP:
            return AlertData.init(title: "", message: Config.shared.strings.invalidOTP, imageName: nil, mainButtonTitle: Config.shared.strings.ok, destructiveButtonTitle: nil)
        case .somethingWentWrong:
            return AlertData.init(title: "", message: Config.shared.strings.somethingWentWrong, imageName: nil, mainButtonTitle: Config.shared.strings.ok, destructiveButtonTitle: nil)
        }
    }
}

struct AlertData {
    var title:String?
    var message: String?
    var imageName: String?
    var mainButtonTitle: String?
    var destructiveButtonTitle:String?
}

protocol AlertViewControllerDelegate: class {
    func mainButtonTapped(_ type:AlertType?)
    func destructiveButtonTapped(_ type:AlertType?)
}

class AlertViewController: UIViewController {

    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var destructiveButton: UIButton!
    @IBOutlet weak var mainButtonView: UIView!
    @IBOutlet weak var seperaterView: UIView!
    
    private var data: AlertData?
    var type: AlertType?
    weak var delegate: AlertViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = type?.getData()
        
        backGroundView.viewCornerRadius(5.0)
        
        titleLbl.font = Config.shared.fontStyles.medium1
        messageLbl.font = Config.shared.fontStyles.regular2
        
        mainButton.viewCornerRadius(5.0)
        mainButton.backgroundColor = Config.shared.colors.textColor
        mainButton.titleLabel?.font = Config.shared.fontStyles.regular2

        destructiveButton.setTitleColor(Config.shared.colors.textColor, for: .normal)
        destructiveButton.backgroundColor = UIColor.clear
        destructiveButton.titleLabel?.font = Config.shared.fontStyles.regular2

        imgView.isHidden = (data?.imageName == nil)
        mainButtonView.isHidden = data?.mainButtonTitle == nil
        destructiveButton.isHidden = data?.destructiveButtonTitle == nil
        seperaterView.isHidden = destructiveButton.isHidden
        titleLbl.text = data?.title
        messageLbl.text = data?.message
        mainButton.setTitle(data?.mainButtonTitle, for: .normal)
        destructiveButton.setTitle(data?.destructiveButtonTitle, for: .normal)
    }
    
    @IBAction func destructiveButtonTapped(_ sender: UIButton) {
        delegate?.destructiveButtonTapped(type)
        dismiss(animated: false) {
            
        }
    }
    
    @IBAction func mainButtonTapped(_ sender: UIButton) {
        delegate?.mainButtonTapped(type)
        dismiss(animated: false) {
            
        }
    }
}

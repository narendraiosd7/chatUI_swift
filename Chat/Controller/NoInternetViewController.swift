//
//  NoInternetViewController.swift
//  Talkies
//
//  Created by santhoshkumar nampally on 25/04/20.
//  Copyright © 2020 santhoshkumar nampally. All rights reserved.
//

import UIKit

class NoInternetViewController: UIViewController {

    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var noInternetImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Config.shared.colors.backgroundColor
        titleLabel.text = Config.shared.strings.noNetworkConnection
        titleLabel.font = Config.shared.fontStyles.medium2
        titleLabel.textColor = Config.shared.colors.textColor
        subTitleLabel.text = Config.shared.strings.noNetworkConnectionSubtitle
        subTitleLabel.font = Config.shared.fontStyles.regular4
        subTitleLabel.textColor = Config.shared.colors.textColor
        noInternetImageView.image = UIImage.init(named: Config.shared.images.noNetwork)
        refreshButton.setTitle(Config.shared.strings.refresh, for: .normal)
        refreshButton.setTitleColor(Config.shared.colors.textColor, for: .normal)
        refreshButton.backgroundColor = Config.shared.colors.backgroundColor1
        refreshButton.viewCornerRadius(20)
    }
    

    @IBAction func refreshButtonTapped(_ sender: UIButton) {
        xmsNotification.postNotification(info: [xmsNotification.eventKey:NotificationType.refreshData.rawValue])
        dismiss(animated: false) {
            
        }
    }
}

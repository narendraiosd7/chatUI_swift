//
//  NewChatRequestView.swift
//  Chat
//
//  Created by narendra. vadde on 24/09/20.
//  Copyright © 2020 narendra. vadde. All rights reserved.
//

import UIKit

protocol NewChatRequestViewDataSource: BaseListViewDataSource {
    var zNotificationCount: String {get}
}

protocol NewChatRequestViewDelegate: BaseListViewDelegate {
    func searchTapped()
    func zNotificationTapped()
    func moreTapped()
}

class NewChatRequestView: BaseListView {
    
    @IBOutlet weak var navBarView: UIView!
    @IBOutlet weak var headerTitleLabel: UILabel!
    @IBOutlet weak var searchButtonImage: UIImageView!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var zNotificationsButtonImage: UIImageView!
    @IBOutlet weak var zNotificationsCountLabel: UILabel!
    @IBOutlet weak var zNotificationsButton: UIButton!
    @IBOutlet weak var moreButtonImage: UIImageView!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var underlineView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var underlineView2: UIView!
    
    weak var dataSource: NewChatRequestViewDataSource? {
        didSet {
            baseDataSource = dataSource
        }
    }
    
    weak var delegate: NewChatRequestViewDelegate? {
        didSet {
            baseDelegate = delegate
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        headerTitleLabel.font = Config.shared.fontStyles.avenirHeavy
        headerTitleLabel.textColor = Config.shared.colors.chatTextColor
        searchButtonImage.image = UIImage(named: Config.shared.images.chatSearch)
        zNotificationsButtonImage.image = UIImage(named: Config.shared.images.chat)
        zNotificationsCountLabel.font = Config.shared.fontStyles.avenirHeavy6
        zNotificationsCountLabel.textColor = Config.shared.colors.chatTextColor1
        zNotificationsCountLabel.backgroundColor = Config.shared.colors.chatBackgroundColor
        zNotificationsCountLabel.viewCornerRadius(4.5)
        moreButtonImage.image = UIImage(named: Config.shared.images.more)
        underlineView.backgroundColor = Config.shared.colors.chatBackgroundColor4
        underlineView2.backgroundColor = Config.shared.colors.chatBackgroundColor4
        descriptionLabel.font = Config.shared.fontStyles.avenirRoman2
        descriptionLabel.textColor = Config.shared.colors.chatTextColor
    }
    
    override func reloadData() {
        super.reloadData()
        headerTitleLabel.text = Config.shared.strings.newChatRequest
        descriptionLabel.text = Config.shared.strings.newChatDescription
        zNotificationsCountLabel.text = dataSource?.zNotificationCount
    }
    
    @IBAction func searchTapped(_ sender: UIButton) {
        delegate?.searchTapped()
    }
    
    @IBAction func zNotificationTapped(_ sender: UIButton) {
        delegate?.zNotificationTapped()
    }
    
    @IBAction func moreTapped(_ sender: UIButton) {
        delegate?.moreTapped()
    }
}

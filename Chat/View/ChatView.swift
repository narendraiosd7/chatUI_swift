//
//  ChatView.swift
//  Mobile-ZeeMusic
//
//  Created by narendra. vadde on 16/09/20.
//  Copyright © 2020 narendra. vadde. All rights reserved.
//

import UIKit

protocol ChatViewDataSource: BaseListViewDataSource {
    var name: String {get}
    var zNotificationsCount: String {get}
    var chatNotificationCount: String {get}
    var homeLabelColor: UIColor {get}
    var newsLabelColor: UIColor {get}
    var postLabelColor: UIColor {get}
    var chatLabelColor: UIColor {get}
    var exploreLabelColor: UIColor {get}
}

protocol ChatViewDelegate: BaseListViewDelegate {
    func searchTapped()
    func zNotificationTapped()
    func moreTapped()
    func homeTapped()
    func newsTapped()
    func postTapped()
    func chatTapped()
    func exploreTapped()
    func selectedChatDetails(source: BaseTableViewCellDataSource?)
    func helpChat()
    func chatNotificationTapped()
}

class ChatView: BaseListView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var navBarView: UIView!
    @IBOutlet weak var navBarTitleLabel: UILabel!
    @IBOutlet weak var searchButtonImage: UIImageView!
    @IBOutlet weak var zButtonIcon: UIImageView!
    @IBOutlet weak var zButtonNotificationView: UIView!
    @IBOutlet weak var zNotificationCountLabel: UILabel!
    @IBOutlet weak var moreButtonImage: UIImageView!
    @IBOutlet weak var bottomBorderView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var chatNotificationImage: UIImageView!
    @IBOutlet weak var chatNotificationsButton: UIButton!
    @IBOutlet weak var chatNotificationCountLabel: UILabel!
    @IBOutlet weak var newChatRequestLabel: UILabel!
    @IBOutlet weak var bottomBorderView1: UIView!
    @IBOutlet weak var homeButtonImagee: UIImageView!
    @IBOutlet weak var homeButtonLabel: UILabel!
    @IBOutlet weak var newsButtonImage: UIImageView!
    @IBOutlet weak var newsButtonLabel: UILabel!
    @IBOutlet weak var postButtonContentView: UIView!
    @IBOutlet weak var postButtonPlusLabel: UILabel!
    @IBOutlet weak var postButtonLabel: UILabel!
    @IBOutlet weak var chatButtonImage: UIImageView!
    @IBOutlet weak var chatButtonLabel: UILabel!
    @IBOutlet weak var exploreButtonImage: UIImageView!
    @IBOutlet weak var exploreButtonLabel: UILabel!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var helpButtonImage: UIImageView!
    
    weak var dataSource: ChatViewDataSource? {
        didSet {
            baseDataSource = dataSource
        }
    }
    
    weak var delegate: ChatViewDelegate? {
        didSet {
            baseDelegate = delegate
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        navBarTitleLabel.font = Config.shared.fontStyles.avenirHeavy
        navBarTitleLabel.textColor = Config.shared.colors.chatTextColor
        searchButtonImage.image = UIImage(named: Config.shared.images.chatSearch)
        zButtonNotificationView.viewCornerRadius(5)
        zButtonNotificationView.backgroundColor = Config.shared.colors.chatBackgroundColor
        zNotificationCountLabel.font = Config.shared.fontStyles.avenirHeavy6
        zNotificationCountLabel.textColor = Config.shared.colors.chatTextColor1
        moreButtonImage.image = UIImage(named: Config.shared.images.more)
        nameLabel.font = Config.shared.fontStyles.avenirRoman15
        chatButtonImage.image = UIImage(named: Config.shared.images.chat1)
        chatNotificationCountLabel.viewCornerRadius(9)
        chatNotificationCountLabel.backgroundColor = Config.shared.colors.chatBackgroundColor
        chatNotificationCountLabel.font =  Config.shared.fontStyles.avenirHeavy13
        chatNotificationCountLabel.textColor = Config.shared.colors.chatTextColor1
        newChatRequestLabel.font = Config.shared.fontStyles.avenirBlack15
        newChatRequestLabel.textColor = Config.shared.colors.chatTextColor2
        homeButtonImagee.image = UIImage(named: Config.shared.images.chatHome)
        homeButtonLabel.font = Config.shared.fontStyles.avenirRoman4
        newsButtonImage.image = UIImage(named: Config.shared.images.chatNews)
        newsButtonLabel.font = Config.shared.fontStyles.avenirRoman4
        postButtonContentView.viewCornerRadius(18)
        postButtonPlusLabel.font = Config.shared.fontStyles.avenirHeavy2
        postButtonPlusLabel.textColor = Config.shared.colors.chatTextColor1
        postButtonLabel.font = Config.shared.fontStyles.avenirRoman4
        chatButtonImage.image = UIImage(named: Config.shared.images.chatMsgs)
        chatButtonLabel.font = Config.shared.fontStyles.avenirRoman4
        exploreButtonImage.image = UIImage(named: Config.shared.images.chatExplore)
        exploreButtonLabel.font = Config.shared.fontStyles.avenirRoman4
        bottomView.layer.shadowColor = Config.shared.colors.shadowColor.cgColor
        bottomView.layer.shadowRadius = 5
        bottomView.layer.shadowOpacity = 1
        bottomView.layer.shadowOffset = CGSize(width: -5, height: -5)
        bottomView.layer.masksToBounds = false
        helpButtonImage.image = UIImage(named: Config.shared.images.chat)
    }
    
    override func reloadData() {
        super.reloadData()
        homeButtonLabel.textColor = dataSource?.homeLabelColor
        newsButtonLabel.textColor = dataSource?.newsLabelColor
        postButtonLabel.textColor = dataSource?.postLabelColor
        chatButtonLabel.textColor = dataSource?.chatLabelColor
        exploreButtonLabel.textColor = dataSource?.exploreLabelColor
        zNotificationCountLabel.text = dataSource?.zNotificationsCount
        chatNotificationCountLabel.text = dataSource?.chatNotificationCount
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
        if let cell = tableView.cellForRow(at: indexPath) as? ImageHorizontalLabelsCell {
            delegate?.selectedChatDetails(source: cell.dataSource)
        }
    }
    
    @IBAction func searchTapped(_ sender: UIButton) {
        delegate?.searchTapped()
    }
    
    @IBAction func znotificationTapped(_ sender: UIButton) {
        delegate?.zNotificationTapped()
    }
    
    @IBAction func moreTapped(_ sender: UIButton) {
        delegate?.moreTapped()
    }
    
    @IBAction func homeTapped(_ sender: UIButton) {
        delegate?.homeTapped()
    }
    
    @IBAction func newsTapped(_ sender: UIButton) {
        delegate?.newsTapped()
    }
    
    @IBAction func postTapped(_ sender: UIButton) {
        delegate?.postTapped()
    }
    
    @IBAction func chatTapped(_ sender: UIButton) {
        delegate?.chatTapped()
    }
    
    @IBAction func exploreTapped(_ sender: UIButton) {
        delegate?.exploreTapped()
    }
    
    @IBAction func helpTapped(_ sender: UIButton) {
        delegate?.chatTapped()
    }
    
    @IBAction func chatNotificationTapped(_ sender: UIButton) {
        delegate?.chatNotificationTapped()
    }
}

//
//  ChatDetailView.swift
//  Chat
//
//  Created by narendra. vadde on 21/09/20.
//  Copyright © 2020 narendra. vadde. All rights reserved.
//

import UIKit

protocol ChatDetailViewDataSource: BaseListViewDataSource {
    var profileImage: String {get}
    var profileTitle: String {get}
    var status: String {get}
}

protocol ChatDetailViewDelegate: BaseListViewDelegate {
    func backTapped()
    func moreTapped()
    func attachmentTapped()
    func emojiTapped()
    func cameraTapped()
    func recordOrSendTapped()
}

class ChatDetailView: BaseListView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var navBarView: UIView!
    @IBOutlet weak var backButtonImage: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileTitleLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var moreButtonImage: UIImageView!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var underlineView: UIView!
    @IBOutlet weak var attachmentButtonImage: UIImageView!
    @IBOutlet weak var attachButton: UIButton!
    @IBOutlet weak var textFieldContentView: UIView!
    @IBOutlet weak var chatTextField: UITextField!
    @IBOutlet weak var textFieldRightButtonImage: UIImageView!
    @IBOutlet weak var textFieldRightButton: UIButton!
    @IBOutlet weak var cameraButtonImage: UIImageView!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var recordOrSendButtonImage: UIImageView!
    @IBOutlet weak var recordOrSendButton: UIButton!
    @IBOutlet weak var textFieldTrailingSpace: NSLayoutConstraint!
    
    
    weak var dataSource: ChatDetailViewDataSource? {
        didSet {
            baseDataSource = dataSource
        }
    }
    
    weak var delegate: ChatDetailViewDelegate? {
        didSet {
            baseDelegate = delegate
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        chatTextField.delegate = self
        backButtonImage.image = UIImage(named: Config.shared.images.backArrow)
        profileImage.viewCornerRadius(22)
        profileTitleLabel.font = Config.shared.fontStyles.avenirHeavy1
        profileTitleLabel.textColor = Config.shared.colors.chatTextColor
        statusLabel.font = Config.shared.fontStyles.avenirRoman13
        statusLabel.textColor = Config.shared.colors.chatTextColor3
        moreButtonImage.image = UIImage(named: Config.shared.images.more)
        underlineView.backgroundColor = Config.shared.colors.chatBackgroundColor4
        attachmentButtonImage.image = UIImage(named: Config.shared.images.attachment)
        textFieldRightButtonImage.image = UIImage(named: Config.shared.images.emoji)
        cameraButtonImage.image = UIImage(named: Config.shared.images.camera)
        recordOrSendButtonImage.image = UIImage(named: Config.shared.images.microphone)
        textFieldContentView.viewCornerRadius(20)
        textFieldContentView.backgroundColor = Config.shared.colors.chatBackgroundColor4
        
    }
    
    override func reloadData() {
        super.reloadData()
        profileImage.image = UIImage(named: dataSource?.profileImage ?? "")
        profileTitleLabel.text = dataSource?.profileTitle
        statusLabel.text = dataSource?.status
    }
    
    @IBAction func backTapped(_ sender: UIButton) {
        delegate?.backTapped()
    }
    
    @IBAction func moreTapped(_ sender: UIButton) {
        
        delegate?.moreTapped()
    }
    
    @IBAction func attachmentTapped(_ sender: UIButton) {
        delegate?.attachmentTapped()
    }
    
    @IBAction func emojiTapped(_ sender: UIButton) {
        delegate?.emojiTapped()
    }
    
    @IBAction func cameraTapped(_ sender: UIButton) {
        delegate?.cameraTapped()
    }
    
    @IBAction func recordOrSendTapped(_ sender: UIButton) {
        delegate?.recordOrSendTapped()
    }
}

extension ChatDetailView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        cameraButtonImage.isHidden = true
        cameraButton.isUserInteractionEnabled = false
        textFieldRightButtonImage.isHidden = true
        textFieldRightButton.isUserInteractionEnabled = false
        textFieldTrailingSpace.constant = 15
        recordOrSendButtonImage.image = UIImage(named: Config.shared.images.send)
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        cameraButtonImage.isHidden = false
        cameraButton.isUserInteractionEnabled = true
        textFieldRightButtonImage.isHidden = false
        textFieldRightButton.isUserInteractionEnabled = true
        textFieldTrailingSpace.constant = 60
        recordOrSendButtonImage.image = UIImage(named: Config.shared.images.microphone)
    }
}

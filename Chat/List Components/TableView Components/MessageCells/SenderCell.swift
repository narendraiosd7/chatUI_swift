//
//  SenderCell.swift
//  Chat
//
//  Created by narendra. vadde on 21/09/20.
//  Copyright © 2020 narendra. vadde. All rights reserved.
//

import UIKit

protocol SenderCellDataSource: BaseTableViewCellDataSource {
    var sendingMessage: String {get}
    var sentTime: String {get}
}

protocol SenderCellDelegate: BaseTableViewCellDelegate {
    
}

class SenderCell: BaseTableViewCell {

    @IBOutlet weak var messageContentView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    weak var dataSource: SenderCellDataSource?
    weak var delegate: SenderCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        messageContentView.layer.cornerRadius = 15
        messageContentView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        messageContentView.backgroundColor = Config.shared.colors.chatBackgroundColor4
        messageLabel.font = Config.shared.fontStyles.avenirRoman3
        messageLabel.textColor = Config.shared.colors.chatTextColor2
        timeLabel.font = Config.shared.fontStyles.avenirLight4
        timeLabel.textColor = Config.shared.colors.chatTextColor3
    }
    
    override func updateData(dataSource: BaseTableViewCellDataSource?) {
        super.updateData(dataSource: dataSource)
        
        if let dataSource = dataSource as? SenderCellDataSource {
            self.dataSource = dataSource
            messageLabel.text = dataSource.sendingMessage
            timeLabel.text = dataSource.sentTime
        }
    }
    
    override func updateDelegate(delegate: BaseTableViewCellDelegate?) {
        super.updateDelegate(delegate: delegate)
        
        if let delegate = delegate as? SenderCellDelegate {
            self.delegate = delegate
            
        }
    }
}

//
//  ReceiverCell.swift
//  Chat
//
//  Created by narendra. vadde on 21/09/20.
//  Copyright © 2020 narendra. vadde. All rights reserved.
//

import UIKit

protocol ReceiverCellDataSource: BaseTableViewCellDataSource {
    var message: String {get}
    var time: String {get}
}

protocol ReceiverCellDelegate: BaseTableViewCellDelegate {
    
}

class ReceiverCell: BaseTableViewCell {

    @IBOutlet weak var messageContentView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    weak var dataSource: ReceiverCellDataSource?
    weak var delegate: ReceiverCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        messageContentView.layer.cornerRadius = 15
        messageContentView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
        messageContentView.backgroundColor = Config.shared.colors.chatBackgroundColor3
        messageLabel.font = Config.shared.fontStyles.avenirRoman3
        messageLabel.textColor = Config.shared.colors.chatTextColor4
        timerLabel.font = Config.shared.fontStyles.avenirLight4
        timerLabel.textColor = Config.shared.colors.chatTextColor3
    }
    
    override func updateData(dataSource: BaseTableViewCellDataSource?) {
        super.updateData(dataSource: dataSource)
        
        if let dataSource = dataSource as? ReceiverCellDataSource {
            self.dataSource = dataSource
            messageLabel.text = dataSource.message
            timerLabel.text = dataSource.time
        }
    }
    
    override func updateDelegate(delegate: BaseTableViewCellDelegate?) {
        super.updateDelegate(delegate: delegate)
        
        if let delegate = delegate as? ReceiverCellDelegate {
            self.delegate = delegate
            
        }
    }
}

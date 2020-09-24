//
//  ImageHorizontalLabelsCell.swift
//  Mobile-ZeeMusic
//
//  Created by narendra. vadde on 15/09/20.
//  Copyright © 2020 narendra. vadde. All rights reserved.
//

import UIKit

protocol ImageHorizontalLabelsCellDataSource: BaseTableViewCellDataSource {
    var image: String {get}
    var title: String {get}
    var description: String {get}
    var time: String {get}
    var count: String {get}
    var isMute: Bool {get}
    var isOnline: Bool {get}
}

protocol ImageHorizontalLabelsCellDelegate: BaseTableViewCellDelegate {
    
}

class ImageHorizontalLabelsCell: BaseTableViewCell {

    @IBOutlet weak var dataContentView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var muteImage: UIImageView!
    
    weak var dataSource: ImageHorizontalLabelsCellDataSource?
    weak var delegate: ImageHorizontalLabelsCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImage.viewCornerRadius(profileImage.frame.size.height/2)
        titleLabel.font = Config.shared.fontStyles.avenirRoman15
        titleLabel.textColor = Config.shared.colors.chatTextColor2
        descriptionLabel.font = Config.shared.fontStyles.avenirRoman3
        descriptionLabel.textColor = Config.shared.colors.chatTextColor3
        timeLabel.font = Config.shared.fontStyles.avenirMedium3
        timeLabel.textColor = Config.shared.colors.chatTextColor3
        countLabel.font = Config.shared.fontStyles.avenirHeavy13
        countLabel.textColor = Config.shared.colors.chatTextColor1
        countLabel.backgroundColor = Config.shared.colors.chatBackgroundColor2
        countLabel.viewCornerRadius(countLabel.frame.size.height/2)
        statusView.backgroundColor = Config.shared.colors.chatBackgroundColor1
        statusView.viewCornerRadius(6.5)
        statusView.putBorder(borderColor: Config.shared.colors.textColor1, borderWidth: 4)
    }
    
    override func updateData(dataSource: BaseTableViewCellDataSource?) {
        super.updateData(dataSource: dataSource)
        
        if let dataSource = dataSource as? ImageHorizontalLabelsCellDataSource {
            self.dataSource = dataSource
            profileImage.image = UIImage(named: dataSource.image)
            titleLabel.text = dataSource.title
            descriptionLabel.text = dataSource.description
            timeLabel.text = dataSource.time
            countLabel.text = dataSource.count
            
            if dataSource.count == "" {
                countLabel.isHidden = true
            } else {
                countLabel.isHidden = false
            }
            
            if dataSource.isOnline {
                statusView.isHidden = false
            } else {
                statusView.isHidden = true
            }
            
            muteImage.image = UIImage(named: dataSource.isMute ? Config.shared.images.chatMute : "")
        }
    }
    
    override func updateDelegate(delegate: BaseTableViewCellDelegate?) {
        super.updateDelegate(delegate: delegate)
        
        if let delegate = delegate as? ImageHorizontalLabelsCellDelegate {
            self.delegate = delegate
        }
    }
    
}

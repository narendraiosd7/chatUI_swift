//
//  VerticalImageLabelCell.swift
//  Mobile-ZeeMusic
//
//  Created by narendra. vadde on 15/09/20.
//  Copyright © 2020 narendra. vadde. All rights reserved.
//

import UIKit

protocol VerticalImageLabelCellDataSource: BaseCardCollectionViewCellDataSource {
    var image: String {get}
    var title: String {get}
    var isOnline: Bool {get}
}

protocol VerticalImageLabelCellDelegate: BaseCardCollectionViewCellDelegate {
    
}

class VerticalImageLabelCell: BaseCardCollectionViewCell {

    @IBOutlet weak var dataContentView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileLabel: UILabel!
    @IBOutlet weak var statusView: UIView!
    
    weak var dataSource: VerticalImageLabelCellDataSource?
    weak var delegate: VerticalImageLabelCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileLabel.font = Config.shared.fontStyles.regular4
        profileLabel.textColor = Config.shared.colors.textColor
        profileImage.viewCornerRadius(profileImage.frame.size.height/2)
        statusView.viewCornerRadius(6)
        statusView.putBorder(borderColor: Config.shared.colors.textColor1, borderWidth: 6)
        statusView.backgroundColor = Config.shared.colors.chatBackgroundColor1
    }
    
    override func updateData(dataSource: BaseCardCollectionViewCellDataSource?) {
        super.updateData(dataSource: dataSource)
        
        if let dataSource = dataSource as? VerticalImageLabelCellDataSource {
            self.dataSource = dataSource
            profileImage.image = UIImage(named: dataSource.image)
            profileLabel.text = dataSource.title
            if dataSource.isOnline {
                statusView.isHidden = false
            } else {
                statusView.isHidden = true
            }
        }
    }
    
    override func updateDelegate(delegate: BaseCardCollectionViewCellDelegate?) {
        super.updateDelegate(delegate: delegate)
        
        if let delegate = delegate as? VerticalImageLabelCellDelegate {
            self.delegate = delegate
            
        }
    }
    

}

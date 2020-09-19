//
//  BaseCardCollectionViewCell.swift
//  Talkies
//
//  Created by santhoshkumar nampally on 23/03/20.
//  Copyright © 2020 santhoshkumar nampally. All rights reserved.
//

import UIKit

protocol BaseCardCellDataSource: class{
    
}

protocol BaseCardCollectionViewCellDelegate: class {
    
}

protocol BaseCardCollectionViewCellDataSource: BaseCardCellDataSource {
    
}

class BaseCardCollectionViewCell: UICollectionViewCell {
    
    weak var baseDataSource: BaseCardCollectionViewCellDataSource?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateData(dataSource: BaseCardCollectionViewCellDataSource?) {
        baseDataSource = dataSource
    }
    
    func updateDelegate(delegate: BaseCardCollectionViewCellDelegate?) {
        
    }
}

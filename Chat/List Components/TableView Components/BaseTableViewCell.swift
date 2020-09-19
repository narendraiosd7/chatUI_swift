//
//  BaseTableViewCell.swift
//  Talkies
//
//  Created by santhoshkumar nampally on 23/03/20.
//  Copyright © 2020 santhoshkumar nampally. All rights reserved.
//

import Foundation
import UIKit

protocol BaseTableViewCellDelegate:class {
    func reloadcell(_ ref: BaseTableViewCell)
}

protocol BaseTableViewCellDataSource: BaseCardCellDataSource {
    
}

class BaseTableViewCell: UITableViewCell
{
    
    weak var baseDataSource: BaseTableViewCellDataSource?
    weak var baseDelegate: BaseTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateData(dataSource: BaseTableViewCellDataSource?) {
        baseDataSource = dataSource
    }
    
    func updateDelegate(delegate: BaseTableViewCellDelegate?) {
        baseDelegate = delegate
    }
}

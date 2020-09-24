//
//  ActionsView.swift
//  Chat
//
//  Created by narendra. vadde on 23/09/20.
//  Copyright © 2020 narendra. vadde. All rights reserved.
//

import UIKit

protocol ActionsViewDataSource: class {
    
}

protocol ActionsViewDelegate: class {
    func backgroundTapped()
    func muteTapped()
    func blockTapped()
}

class ActionsView: UIView {
    
    @IBOutlet weak var backgroundButton: UIButton!
    @IBOutlet weak var actionsContentView: UIView!
    @IBOutlet weak var muteButton: UIButton!
    @IBOutlet weak var blockButton: UIButton!
    
    weak var dataSource: ActionsViewDataSource?
    weak var delegate: ActionsViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundButton.backgroundColor = Config.shared.colors.chatBackgroundColor5
        muteButton.setTitleColor(Config.shared.colors.chatTextColor3, for: .normal)
        muteButton.titleLabel?.font = Config.shared.fontStyles.avenirMedium15
        muteButton.setTitle(Config.shared.strings.mute, for: .normal)
        blockButton.setTitleColor(Config.shared.colors.chatTextColor3, for: .normal)
        blockButton.titleLabel?.font = Config.shared.fontStyles.avenirMedium15
        blockButton.setTitle(Config.shared.strings.block, for: .normal)
    }
    
    @IBAction func backgroundTapped(_ sender: UIButton) {
        delegate?.backgroundTapped()
    }
    
    @IBAction func muteTapped(_ sender: UIButton) {
        delegate?.muteTapped()
    }
    
    @IBAction func blockTapped(_ sender: UIButton) {
        delegate?.blockTapped()
    }
}

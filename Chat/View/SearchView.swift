//
//  SearchView.swift
//  Chat
//
//  Created by narendra. vadde on 23/09/20.
//  Copyright © 2020 narendra. vadde. All rights reserved.
//

import UIKit

protocol ChatSearchViewDataSource: BaseListViewDataSource {
    func showViews() -> (chatSearch: Bool, search: Bool)
}

protocol ChatSearchViewDelegate: BaseListViewDelegate {
    func backTapped()
    func chatSearchCancelTapped()
    func searchCancelTapped()
    func chatSearchTextFieldTextDidChange(text: String)
    func searchTextFieldTextDidChange(text: String)
}

class SearchView: BaseListView {

    @IBOutlet weak var navBar: UIView!
    @IBOutlet weak var backButtonImage: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var chatSearchTextField: UITextField!
    @IBOutlet weak var cancelButtonImage: UIImageView!
    @IBOutlet weak var chatSearchCancelButton: UIButton!
    @IBOutlet weak var underLineView: UIView!
    @IBOutlet weak var searchConentView: UIView!
    @IBOutlet weak var textFieldContentView: UIView!
    @IBOutlet weak var searchIcon: UIImageView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchCancelButton: UIButton!
    
    weak var dataSource: ChatSearchViewDataSource? {
        didSet {
            baseDataSource = dataSource
        }
    }
    
    weak var delegate: ChatSearchViewDelegate? {
        didSet {
            baseDelegate = delegate
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        chatSearchTextField.delegate = self
        searchTextField.delegate = self
        backButtonImage.image = UIImage(named: Config.shared.images.backArrow)
        chatSearchTextField.font = Config.shared.fontStyles.avenirBlack3
        chatSearchTextField.textColor = Config.shared.colors.chatTextColor5
        cancelButtonImage.image = UIImage(named: Config.shared.images.cross)
        textFieldContentView.viewCornerRadius(22)
        textFieldContentView.backgroundColor = Config.shared.colors.chatBackgroundColor4
        searchIcon.image = UIImage(named: Config.shared.images.chatSearch)
        searchTextField.textColor = Config.shared.colors.chatTextColor5
        searchTextField.font = Config.shared.fontStyles.avenirBook3
        searchCancelButton.titleLabel?.font = Config.shared.fontStyles.avenirHeavy3
        searchCancelButton.setTitleColor(Config.shared.colors.chatTextColor6, for: .normal)
        searchCancelButton.setTitle(Config.shared.strings.cancel, for: .normal)
        chatSearchTextField.addTarget(self, action: #selector(chatSearchTextFieldDidChange(_:)), for: .editingChanged)
        searchTextField.addTarget(self, action: #selector(searchTextFieldDidChange(_:)), for: .editingChanged)
    }
    
    override func reloadData() {
        super.reloadData()
        if let source = dataSource {
            let show = source.showViews()
            searchConentView.isHidden = !show.search
            navBar.isHidden = !show.chatSearch
        }
    }
    
    @IBAction func backTapped(_ sender: UIButton) {
        delegate?.backTapped()
    }
    
    @IBAction func chatSearchCancelTapped(_ sender: UIButton) {
        delegate?.chatSearchCancelTapped()
    }
    
    @IBAction func searchCancelTapped(_ sender: UIButton) {
        delegate?.searchCancelTapped()
    }
}

extension SearchView: UITextFieldDelegate {
    @objc func chatSearchTextFieldDidChange(_ textField: UITextField) {
        delegate?.chatSearchTextFieldTextDidChange(text: textField.text ?? "")
    }
    
    @objc func searchTextFieldDidChange(_ textField: UITextField) {
        delegate?.searchTextFieldTextDidChange(text: textField.text ?? "")
    }
}

//
//  ErrorView.swift
//  Talkies
//
//  Created by santhoshkumar nampally on 23/03/20.
//  Copyright © 2020 santhoshkumar nampally. All rights reserved.
//

import UIKit

protocol ErrorViewDelegate: class {
    func reloadButtonTapped()
}

class ErrorView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var errorTitle: UILabel!
    @IBOutlet weak var reloadButton: UIButton!
    
    weak var delegate: ErrorViewDelegate?
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        xibSetUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetUp()
    }
    
    private func xibSetUp()
    {
        if let view = loadXibFromNib() {
            contentView = view
            contentView.frame = bounds
            contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            contentView.translatesAutoresizingMaskIntoConstraints = true
            addSubview(view)
        }
    }
    
    private func loadXibFromNib() -> UIView?
    {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "ErrorView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as? UIView
        return view
    }
    
    @IBAction func reloadButtonTapped(_ sender: UIButton)
    {
        delegate?.reloadButtonTapped()
    }
}

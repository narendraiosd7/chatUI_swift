//
//  LoaderViewController.swift
//  Talkiez
//
//  Created by santhoshkumar nampally on 30/04/20.
//  Copyright © 2020 santhoshkumar nampally. All rights reserved.
//

import UIKit

class LoaderViewController: UIViewController {

    @IBOutlet weak var loaderImageView: UIImageView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
      //  loaderImageView.image = UIImage.gifImageWithName("loader")
        activityIndicator.startAnimating()
        view.isUserInteractionEnabled = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
}

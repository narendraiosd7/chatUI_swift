//
//  BaseViewController.swift
//  Talkies
//
//  Created by santhoshkumar nampally on 23/03/20.
//  Copyright © 2020 santhoshkumar nampally. All rights reserved.
//

import UIKit

class BaseViewController: EventBaseViewController {
    
    let loader = Controller.loader.getViewController()
    var errorView = ErrorView.init(frame: CGRect.zero)
    var reloadViewHeight: CGFloat = 50
    var startTime = Date()
    var duration: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(reloadScreen(notfication:)), name: .reloadScreen, object: nil)
        startTime = Date()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        duration = Int(Date().timeIntervalSince(startTime))
    }
    
    func push(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func popTheController() {
        navigationController?.popViewController(animated: true)
    }
    
    func showAlert(_ type: AlertType ,presentController: UIViewController?, callBackDelegate: AlertViewControllerDelegate?) {
        DispatchQueue.main.async {
            if let controller: AlertViewController = Controller.alert.getViewController() as? AlertViewController{
                controller.modalPresentationStyle = .overCurrentContext
                controller.type = type
                controller.delegate = callBackDelegate
                presentController?.present(controller, animated: false, completion: {
                    
                })
            }
        }
    }
    func showLoader(_ title:String, presentController: UIViewController?) {
        DispatchQueue.main.async { [weak self] in
            if (self?.loader.parent != nil) {
                self?.hideLoader()
            }
            
            if let ref = self {
//                UIApplication.shared.beginIgnoringInteractionEvents()
                ref.addChild(ref.loader)
                ref.loader.view.isUserInteractionEnabled = false
                ref.loader.view.frame = ref.view.frame
                ref.view.addSubview(ref.loader.view)
            }
        }
    }
    
    func presentVC(_ controller: UIViewController) {
        self.present(controller, animated: true) {
            controller.presentationController?.presentedView?.gestureRecognizers?[0].isEnabled = false
        }
    }
    
    func hideLoader() {
        DispatchQueue.main.async { [weak self] in
            self?.loader.view.removeFromSuperview()
            self?.loader.removeFromParent()
//            UIApplication.shared.endIgnoringInteractionEvents()
        }
    }
    
    func getPresentController() -> UIViewController? {
        return self
    }
    
    @objc func reloadScreen(notfication: NSNotification?) {
        
    }
    
    func showReloadView(_ type:ResponseStatus) {
        DispatchQueue.main.async {
            if (type == .noInternetConnection) {
                self.presentVC(Controller.noInternet.getViewController())
            }
            else {
                let (displayStr, show) = type.showErrorView()
                if show {
                    self.errorView.removeFromSuperview()
                    self.errorView = ErrorView.init(frame: CGRect(x: 0, y: self.view.bounds.height - self.reloadViewHeight, width: self.view.bounds.width, height: self.reloadViewHeight))
                    self.errorView.errorTitle.text = displayStr
                    self.errorView.delegate = self
                    // self.view.addSubview(self.errorView)
                    self.view.layoutSubviews()
                }
                else{
                    self.errorView.removeFromSuperview()
                }
            }
        }
    }
    
    func popToRoot() {
        navigationController?.popToRootViewController(animated: true)
    }
}

extension BaseViewController: ErrorViewDelegate {
    func reloadButtonTapped() {
        xmsNotification.postNotification(info: [xmsNotification.eventKey:NotificationType.refreshData.rawValue])
    }
}

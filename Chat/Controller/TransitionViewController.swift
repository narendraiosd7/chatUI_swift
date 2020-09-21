//
//  TransitionViewController.swift
//  Talkies
//
//  Created by santhoshkumar nampally on 23/03/20.
//  Copyright © 2020 santhoshkumar nampally. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    
    
    override func viewDidLoad() {
        NotificationCenter.default.addObserver(self, selector: #selector(reloadScreen(notfication:)), name: .reloadScreen, object: nil)
        requestForConfig()
    }
    
    func requestForConfig() {
        checkForTheState()
        //        AppConfig.getAppConfig { [weak self] (data) in
        //            do{
        //                if let ios = data["ios"] as? [String:Any]{
        //                    let data = try JSONSerialization.data(withJSONObject: ios, options: .prettyPrinted)
        //                    config = try JSONDecoder().decode(AppConfigModel.self, from: data)
        //                    self?.checkConfig()
        //                }
        //            }
        //            catch{
        //                self?.checkForTheState()
        //            }
        //        }
    }
    
    func checkConfig() {
        if let configData = config
        {
            if let forceUpdate = configData.forceUpdate,
                let suggestedUpdated = config?.suggestedUpdate,
                let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String,
                let appVersionValue = Float(appVersion)
            {
                let forceUpdateVal = Float(forceUpdate) ?? 0
                let suggestedUpdateVal = Float(suggestedUpdated) ?? 0
                
                if (forceUpdateVal > appVersionValue){
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
                        self.showAlert(.forceUpdate, presentController: self, callBackDelegate: self)
                    }
                }
                else if (suggestedUpdateVal > appVersionValue){
                    self.showAlert(.suggestedUpdate, presentController: self, callBackDelegate: self)
                }
                else {
                    self.checkForTheState()
                }
            }else{
                self.checkForTheState()
            }
        } else {
            self.checkForTheState()
        }
    }
    
    @objc func reloadScreen(notfication: NSNotification?) {
        if let userInfo = notfication?.object as? [String: Any], let type = userInfo[xmsNotification.typeKey] as? NotificationType {
            switch type {
            case .loggedOut:
                checkForTheState()
            default:
                break
            }
        }
    }
    
    func checkForTheState() {
        if let isFirstTimeLoad = UserDefaults.standard.value(forKey: Config.shared.firstTimeLoadKey) as? Bool {
            let controller = Controller.interest.getViewController()
            viewControllers = [controller]
        } else {
            let controller = Controller.chatDetails.getViewController()
            viewControllers = [controller]
        }
    }
    
    func showAlert(_ type: AlertType ,presentController: UIViewController?, callBackDelegate: AlertViewControllerDelegate?) {
        if let controller: AlertViewController = Controller.alert.getViewController() as? AlertViewController{
            controller.modalPresentationStyle = .overCurrentContext
            controller.type = type
            controller.delegate = self
            presentController?.present(controller, animated: false, completion: {
                
            })
        }
    }
}

extension BaseNavigationController: ChatViewControllerDelegate {
    func stateGotUpdated() {
        checkForTheState()
    }
}

extension BaseNavigationController: AlertViewControllerDelegate
{
    func mainButtonTapped(_ type: AlertType?) {
        if let appUrl = config?.appstoreURL, let url = URL(string: appUrl)
        {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        requestForConfig()
    }
    
    func destructiveButtonTapped(_ type: AlertType?) {
        checkForTheState()
    }
}


class HomeNavigationController : UINavigationController {
    
}

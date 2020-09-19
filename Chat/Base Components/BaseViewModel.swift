//
//  BaseViewModel.swift
//  Talkies
//
//  Created by santhoshkumar nampally on 23/03/20.
//  Copyright © 2020 santhoshkumar nampally. All rights reserved.
//

import Foundation
import UIKit

protocol BaseViewModelDelegate: class {
    func showLoader(_ title:String, presentController: UIViewController?)
    func hideLoader()
    func getPresentController() -> UIViewController?
    func presentVC(_ controller:UIViewController)
    func showAlert(_ type: AlertType ,presentController: UIViewController?, callBackDelegate: AlertViewControllerDelegate?)
    func showReloadView(_ type:ResponseStatus)
    func updateUI()
    func push(_ viewController: UIViewController)
    func popToRoot()
    func popTheController()
}

extension BaseViewModelDelegate {
    func validateResponse(_ data:[String:Any]) {
        if let status = data[ResponseStatus.keyForResponseStatus()] as? ResponseStatus {
            showReloadView(status)
            
            switch status {
            case .dataDoesNotExists:
                showAlert(.somethingWentWrong, presentController: getPresentController(), callBackDelegate: nil)
            default:
                break
            }
        }
    }
}

class BaseViewModel {
    weak var baseDelegate:BaseViewModelDelegate?
    func reloadScreen(notfication: NSNotification?) {
        if let userInfo = notfication?.object as? [String: Any], let type = userInfo[xmsNotification.typeKey] as? NotificationType {
            switch type {
            default:
                break
            }
        }
    }
}

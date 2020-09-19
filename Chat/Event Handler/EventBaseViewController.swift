//
//  EventBaseViewController.swift
//  Talkies
//
//  Created by santhoshkumar nampally on 08/04/20.
//  Copyright © 2020 santhoshkumar nampally. All rights reserved.
//

import UIKit

enum ScreenEvent: String {
    case screenDidLoad = "screenDidLoad"
    case screenAppeared = "screenAppeared"
    case screenDisappeared = "screenDisappeared"
}

class EventBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        EventManager.updateScreenEvent(id: String(describing: self), state: ScreenEvent.screenDidLoad)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        EventManager.updateScreenEvent(id: String(describing: self), state: ScreenEvent.screenAppeared)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        EventManager.updateScreenEvent(id: String(describing: self), state: ScreenEvent.screenDisappeared)
    }
}

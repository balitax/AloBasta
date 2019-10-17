//  
//  DashboardUI.swift
//  AloBasta
//
//  Created by Agus Cahyono on 17/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

class DashboardUI: UIViewController {

    var presenter: DashboardPresentation!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
}


extension DashboardUI: DashboardView {
    
}



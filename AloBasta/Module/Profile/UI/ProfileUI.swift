//  
//  ProfileUI.swift
//  AloBasta
//
//  Created by Agus Cahyono on 17/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

class ProfileUI: UIViewController {

    var presenter: ProfilePresentation!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
}


extension ProfileUI: ProfileView {
    
}



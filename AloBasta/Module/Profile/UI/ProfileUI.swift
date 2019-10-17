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
        self.navigationItem.title = "Profile"
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    @IBAction func didLogoutTapped(_ sender: UIButton) {
        presenter.didLogout()
    }
    
    
}


extension ProfileUI: ProfileView {
    
}



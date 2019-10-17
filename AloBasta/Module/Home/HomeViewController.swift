//
//  HomeViewController.swift
//  AloBasta
//
//  Created by Agus Cahyono on 17/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

class HomeViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addTabbarItem()
    }
    
    func addTabbarItem() {
        
        self.tabBar.tintColor = UIColor.defaultTheme
        self.tabBar.backgroundColor = .white
        
        let homeview = DashboardRouter.assembleModule()
        homeview.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home_icon"), tag: 0)
        
        let profileView = ProfileRouter.assembleModule()
        profileView.title = "Profile"
        profileView.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profile_icon"), tag: 3)
        
        self.viewControllers = [homeview, profileView]
        
    }
    
}

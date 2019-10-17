//  
//  ProfileRouter.swift
//  AloBasta
//
//  Created by Agus Cahyono on 17/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//


import Foundation
import UIKit

class ProfileRouter {

    weak var viewController: UIViewController?

}

extension ProfileRouter: ProfileWireframe {
    
    static func assembleModule() -> UIViewController {
        
        let view = ProfileUI()
        let router = ProfileRouter()
        let interactor = ProfileInteractor()
        let presenter = ProfilePresenter(view: view, interactor: interactor, router: router)
        
        let navigation = UINavigationController(rootViewController: view)
        
        view.presenter =  presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        router.viewController = view
        
        interactor.output = presenter
        
        return navigation
    }
    
    func presentLogin() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        appDelegate.setRootViewController(AuthRouter.assembleModule())
    }
    
}

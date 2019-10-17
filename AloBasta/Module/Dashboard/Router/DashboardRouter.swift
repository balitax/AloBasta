//  
//  DashboardRouter.swift
//  AloBasta
//
//  Created by Agus Cahyono on 17/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//


import Foundation
import UIKit

class DashboardRouter {

    weak var viewController: UIViewController?

}

extension DashboardRouter: DashboardWireframe {
    
    static func assembleModule() -> UIViewController {
        
        let view = DashboardUI()
        let router = DashboardRouter()
        let interactor = DashboardInteractor()
        let presenter = DashboardPresenter(view: view, interactor: interactor, router: router)
        
        let navigation = UINavigationController(rootViewController: view)
        
        view.presenter =  presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        router.viewController = view
        
        interactor.output = presenter
        
        return navigation
    }
    
}

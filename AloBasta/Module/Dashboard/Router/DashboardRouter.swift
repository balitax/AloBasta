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
        let viewModel = DashboardViewModel()
        let router = DashboardRouter()
        let interactor = DashboardInteractor()
        let presenter = DashboardPresenter(view: view, viewModel: viewModel, interactor: interactor, router: router)
        
        let navigation = UINavigationController(rootViewController: view)
        
        view.presenter =  presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        router.viewController = view
        
        interactor.output = presenter
        
        return navigation
    }
    
    func presentDetail(from view: PresentableView) {
        let detail = DetailImageRouter.assembleModule()
        detail.hidesBottomBarWhenPushed = true
        if let navigationController = view.presentedViewController() as? UINavigationController {
            navigationController.pushViewController(detail, animated: true)
        }
    }
    
}

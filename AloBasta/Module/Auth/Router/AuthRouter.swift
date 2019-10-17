//  
//  AuthRouter.swift
//  AloBasta
//
//  Created by Agus Cahyono on 17/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//


import Foundation
import UIKit

class AuthRouter {

    weak var viewController: UIViewController?

}

extension AuthRouter: AuthWireframe {
    
    static func assembleModule() -> UIViewController {
        
        let view = AuthUI()
        let router = AuthRouter()
        let interactor = AuthInteractor()
        let presenter = AuthPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter =  presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        router.viewController = view
        
        interactor.output = presenter
        
        return view
    }
    
}

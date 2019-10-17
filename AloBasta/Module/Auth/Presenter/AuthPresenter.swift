//  
//  AuthPresenter.swift
//  AloBasta
//
//  Created by Agus Cahyono on 17/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit


/// AuthPresenter
class AuthPresenter {
    // TODO: Declare view methods
    var view: AuthView!
    var router: AuthWireframe!
    var interactor: AuthUseCase!
    
    init(view: AuthView, interactor: AuthUseCase, router: AuthWireframe) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

extension AuthPresenter: AuthPresentation {
    
    func presentDashboard() {
        router.presentDashboard()
    }
    
    func didLogin(email: String, password: String) {
        interactor.didLogin(email: email, password: password)
    }
    
}

extension AuthPresenter: AuthInteractorOutput {
    
    func onSuccessLogin() {
        self.view.configureView(.success)
    }
    
    func onError(error: String) {
        self.view.configureView(.error(description: error ))
    }
    
    
}

//  
//  ProfilePresenter.swift
//  AloBasta
//
//  Created by Agus Cahyono on 17/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit


/// ProfilePresenter
class ProfilePresenter {
    // TODO: Declare view methods
    var view: ProfileView!
    var router: ProfileWireframe!
    var interactor: ProfileUseCase!
    
    init(view: ProfileView, interactor: ProfileUseCase, router: ProfileWireframe) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

extension ProfilePresenter: ProfilePresentation {
    
    func didLogout() {
        interactor.didLogout()
        router.presentLogin()
    }
    
}

extension ProfilePresenter: ProfileInteractorOutput {
    
}

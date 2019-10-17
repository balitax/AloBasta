//  
//  DashboardPresenter.swift
//  AloBasta
//
//  Created by Agus Cahyono on 17/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit


/// DashboardPresenter
class DashboardPresenter {
    // TODO: Declare view methods
    var view: DashboardView!
    var router: DashboardWireframe!
    var interactor: DashboardUseCase!
    
    init(view: DashboardView, interactor: DashboardUseCase, router: DashboardWireframe) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

extension DashboardPresenter: DashboardPresentation {
    
    func viewDidLoad() {  }
    
}

extension DashboardPresenter: DashboardInteractorOutput {
    
}

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
    var viewModel: DashboardViewModel!
    var router: DashboardWireframe!
    var interactor: DashboardUseCase!
    
    init(view: DashboardView, viewModel: DashboardViewModel, interactor: DashboardUseCase, router: DashboardWireframe) {
        self.view = view
        self.viewModel = viewModel
        self.interactor = interactor
        self.router = router
    }
    
}

extension DashboardPresenter: DashboardPresentation {
    
    func viewDidLoad() {  }
    
    func presentDetail() {
        router.presentDetail(from: view)
    }
    
    func numberOfSection() -> Int {
        return viewModel.items.count
    }
    
    func numberOfRow(in section: Int) -> Int {
        return viewModel.items[section].count
    }
    
    func item(at indexPath: IndexPath) -> CellRepresentable {
        return viewModel.getItem(at: indexPath)
    }
    
}

extension DashboardPresenter: DashboardInteractorOutput {
    
}

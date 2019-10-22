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
    
    func selectedImage(_ index: IndexPath) -> Hit {
        return viewModel.pixabay[index.row]
    }
    
    
    func loadImages() {
        interactor.loadImages()
    }
    
    func presentDetail(_ data: Hit) {
        router.presentDetail(data: data, from: view)
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
    
    func onLoadPixabay(_ data: [Hit]) {
        viewModel.pixabay = data
        self.view.configureView(.success)
    }
    
    func onError(_ error: Error) {
        self.view.configureView(.error(description: error.localizedDescription))
    }
    
    
}

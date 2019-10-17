//  
//  DetailImagePresenter.swift
//  AloBasta
//
//  Created by Agus Cahyono on 17/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit


/// DetailImagePresenter
class DetailImagePresenter {
    // TODO: Declare view methods
    var view: DetailImageView!
    var viewModel: DetailImageViewModel!
    var router: DetailImageWireframe!
    var interactor: DetailImageUseCase!
    
    init(view: DetailImageView,viewModel: DetailImageViewModel, interactor: DetailImageUseCase, router: DetailImageWireframe) {
        self.view = view
        self.viewModel = viewModel
        self.interactor = interactor
        self.router = router
    }
    
}

extension DetailImagePresenter: DetailImagePresentation {
    
    func numberOfSection() -> Int {
        return viewModel.items.count
    }
    
    func numberOfRow(in section: Int) -> Int {
        return viewModel.items[section].count
    }
    
    func item(at indexPath: IndexPath) -> CellRepresentable {
        return viewModel.getItem(at: indexPath)
    }
    
    func viewDidLoad() {  }
    
}

extension DetailImagePresenter: DetailImageInteractorOutput {
    
}

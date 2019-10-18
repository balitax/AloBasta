//  
//  DetailImageRouter.swift
//  AloBasta
//
//  Created by Agus Cahyono on 17/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//


import Foundation
import UIKit

class DetailImageRouter {

    weak var viewController: UIViewController?

}

extension DetailImageRouter: DetailImageWireframe {
    
    
    static func assembleModule(_ data: Hit) -> UIViewController {
        
        let view = DetailImageUI()
        let viewModel = DetailImageViewModel()
        let router = DetailImageRouter()
        let interactor = DetailImageInteractor()
        let presenter = DetailImagePresenter(view: view, viewModel: viewModel,  interactor: interactor
            , router: router)
        
        viewModel.pixabay = data
        view.presenter =  presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        router.viewController = view
        
        interactor.output = presenter
        
        return view
    }
    
    
}

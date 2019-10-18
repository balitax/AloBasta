//  
//  DashboardContract.swift
//  AloBasta
//
//  Created by Agus Cahyono on 17/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

protocol DashboardView: PresentableView, AlertableView {
    // TODO: Declare view methods
    var presenter: DashboardPresentation! { get set }
    func configureView(_ state: ViewStateKind)
}

protocol DashboardPresentation: DataSource {
    // TODO: Declare presentation methods
    var view: DashboardView! { get set }
    var interactor: DashboardUseCase! { get set }
    var router: DashboardWireframe! { get set }
    
    func loadImages()
    func presentDetail(_ data: Hit)
    func selectedImage(_ index: IndexPath) -> Hit
}

protocol DashboardUseCase: class {
    // TODO: Declare use case methods
    var output: DashboardInteractorOutput! { get set }
    func loadImages()
}

protocol DashboardInteractorOutput: class {
    // TODO: Declare interactor output methods
    func onLoadPixabay(_ data: [Hit])
    func onError(_ error: Error)
}

protocol DashboardWireframe: class {
    // TODO: Declare wireframe methods
    var viewController: UIViewController? { get set }
    func presentDetail(data: Hit, from view: PresentableView)
    static func assembleModule() -> UIViewController
}


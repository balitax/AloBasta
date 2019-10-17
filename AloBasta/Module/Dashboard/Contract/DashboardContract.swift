//  
//  DashboardContract.swift
//  AloBasta
//
//  Created by Agus Cahyono on 17/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

protocol DashboardView: PresentableView {
    // TODO: Declare view methods
    var presenter: DashboardPresentation! { get set }
}

protocol DashboardPresentation: DataSource {
    // TODO: Declare presentation methods
    var view: DashboardView! { get set }
    var interactor: DashboardUseCase! { get set }
    var router: DashboardWireframe! { get set }
    
    func viewDidLoad()
    func presentDetail()
}

protocol DashboardUseCase: class {
    // TODO: Declare use case methods
    var output: DashboardInteractorOutput! { get set }
}

protocol DashboardInteractorOutput: class {
    // TODO: Declare interactor output methods
}

protocol DashboardWireframe: class {
    // TODO: Declare wireframe methods
    var viewController: UIViewController? { get set }
    func presentDetail(from view: PresentableView)
    static func assembleModule() -> UIViewController
}


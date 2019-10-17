//  
//  DashboardContract.swift
//  AloBasta
//
//  Created by Agus Cahyono on 17/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

protocol DashboardView: IndicateTableView {
    // TODO: Declare view methods
    var presenter: DashboardPresentation! { get set }
}

protocol DashboardPresentation: class {
    // TODO: Declare presentation methods
    var view: DashboardView? { get set }
    var interactor: DashboardUseCase! { get set }
    var router: DashboardWireframe! { get set }
    
    func viewDidLoad()
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
    static func assembleModule() -> UIViewController
}


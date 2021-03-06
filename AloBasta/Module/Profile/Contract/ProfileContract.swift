//  
//  ProfileContract.swift
//  AloBasta
//
//  Created by Agus Cahyono on 17/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

protocol ProfileView: PresentableView, AlertableView {
    // TODO: Declare view methods
    var presenter: ProfilePresentation! { get set }
}

protocol ProfilePresentation: class {
    // TODO: Declare presentation methods
    var view: ProfileView! { get set }
    var interactor: ProfileUseCase! { get set }
    var router: ProfileWireframe! { get set }
    
    func didLogout()
}

protocol ProfileUseCase: class {
    // TODO: Declare use case methods
    var output: ProfileInteractorOutput! { get set }
    func didLogout()
}

protocol ProfileInteractorOutput: class {
    // TODO: Declare interactor output methods
}

protocol ProfileWireframe: class {
    // TODO: Declare wireframe methods
    var viewController: UIViewController? { get set }
    func presentLogin()
    static func assembleModule() -> UIViewController
}


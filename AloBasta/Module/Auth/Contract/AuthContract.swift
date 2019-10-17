//  
//  AuthContract.swift
//  AloBasta
//
//  Created by Agus Cahyono on 17/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

protocol AuthView: PresentableView, AlertableView {
    // TODO: Declare view methods
    var presenter: AuthPresentation! { get set }
    func configureView(_ state: ViewStateKind)
}

protocol AuthPresentation: class {
    // TODO: Declare presentation methods
    var view: AuthView! { get set }
    var interactor: AuthUseCase! { get set }
    var router: AuthWireframe! { get set }
    
    func didLogin(email: String, password: String)
}

protocol AuthUseCase: class {
    // TODO: Declare use case methods
    var output: AuthInteractorOutput! { get set }
    func didLogin(email: String, password: String)
}

protocol AuthInteractorOutput: class {
    // TODO: Declare interactor output methods
    func onSuccessLogin()
    func onError(error: String)
}

protocol AuthWireframe: class {
    // TODO: Declare wireframe methods
    var viewController: UIViewController? { get set }
    static func assembleModule() -> UIViewController
}


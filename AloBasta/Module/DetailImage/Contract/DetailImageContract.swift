//  
//  DetailImageContract.swift
//  AloBasta
//
//  Created by Agus Cahyono on 17/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

protocol DetailImageView: PresentableView {
    // TODO: Declare view methods
    var presenter: DetailImagePresentation! { get set }
}

protocol DetailImagePresentation: DataSource {
    // TODO: Declare presentation methods
    var view: DetailImageView! { get set }
    var interactor: DetailImageUseCase! { get set }
    var router: DetailImageWireframe! { get set }
    
    func viewDidLoad()
}

protocol DetailImageUseCase: class {
    // TODO: Declare use case methods
    var output: DetailImageInteractorOutput! { get set }
}

protocol DetailImageInteractorOutput: class {
    // TODO: Declare interactor output methods
}

protocol DetailImageWireframe: class {
    // TODO: Declare wireframe methods
    var viewController: UIViewController? { get set }
    static func assembleModule(_ data: Hit) -> UIViewController
}


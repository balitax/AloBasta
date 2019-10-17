//  
//  AuthUI.swift
//  AloBasta
//
//  Created by Agus Cahyono on 17/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

class AuthUI: UIViewController {

    @IBOutlet weak var txUsername: UITextField!
    @IBOutlet weak var txPassword: UITextField!
    @IBOutlet weak var btnShowPassword: UIButton!
    
    
    var presenter: AuthPresentation!
    var isShowPassword = false

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapLogin(_ sender: UIButton) {
        
        guard let email = self.txUsername.text else { return }
        guard let password = self.txPassword.text else { return }
        
        presenter.didLogin(email: email, password: password)
        
    }
    
    @IBAction func didTapShowPassword(_ sender: UIButton) {
        isShowPassword.toggle()
        if isShowPassword {
            txPassword.isSecureTextEntry = false
        } else {
            txPassword.isSecureTextEntry = true
        }
        isShowPassword ? btnShowPassword.setImage(UIImage(named: "open_password"), for: .normal) : btnShowPassword.setImage(UIImage(named: "unopen_password"), for: .normal)
    }
    
    
    
}


extension AuthUI: AuthView {
    
    func configureView(_ state: ViewStateKind) {
        switch state {
        case .success:
            presenter.presentDashboard()
        case .error(let error):
            let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            self.showAlert(viewController: self, prefferedStyle: .alert, title: "Oops", message: error, alertActions: [okAction])
        case .initial:
            break
        case .empty:
            break
        }
    }
    
}



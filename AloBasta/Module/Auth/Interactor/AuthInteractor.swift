//  
//  AuthInteractor.swift
//  AloBasta
//
//  Created by Agus Cahyono on 17/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

class AuthInteractor {
    // TODO: Declare view methods
    weak var output: AuthInteractorOutput!
}

extension AuthInteractor: AuthUseCase {
    
    func didLogin(email: String, password: String) {
        if email.isEmpty {
            self.output.onError(error: "Harap masukkan Email anda")
        }  else if !email.validateEmail(enteredEmail: email) {
            self.output.onError(error: "Format Email yang anda masukkan salah")
        } else if password.isEmpty {
            self.output.onError(error: "Harap masukkan password anda")
        } else if password.count <= 5 {
            self.output.onError(error: "Isian password minimal 6 karakter")
        } else {
            UserDefaultsManager.shared().email = email
            UserDefaultsManager.shared().password = password
            self.output.onSuccessLogin()
        }
        
    }
    
}

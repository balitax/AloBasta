//  
//  ProfileInteractor.swift
//  AloBasta
//
//  Created by Agus Cahyono on 17/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

class ProfileInteractor {
    // TODO: Declare view methods
    weak var output: ProfileInteractorOutput!
}

extension ProfileInteractor: ProfileUseCase {
 
    func didLogout() {
        UserDefaultsManager.shared().email = ""
        UserDefaultsManager.shared().password = ""
    }
    
}

//
//  UserDefaultsManager.swift
//  AloBasta
//
//  Created by Agus Cahyono on 17/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import Foundation

struct Constants {
    struct Keys {
        static let email = "email"
        static let password = "password"
    }
}

class UserDefaultsManager {
    var defaults = UserDefaults()

    private static var sharedUserDefaults: UserDefaultsManager = {
        return UserDefaultsManager()
    }()

    class func shared() -> UserDefaultsManager {
        return sharedUserDefaults
    }
    
    init() {
        defaults = UserDefaults()
    }
    
    func setData(_ value: [String]?, forKey defaultName: String){
        defaults.set(value, forKey: defaultName)
        defaults.synchronize()
    }
    
    func getData(forKey defaultName: String) -> [String]?{
        return defaults.array(forKey: defaultName) as? [String]
    }
    
    var email: String {
        set(newValue) {
            defaults.set(newValue, forKey: Constants.Keys.email)
            defaults.synchronize()
        }
        get {
            return defaults.string(forKey: Constants.Keys.email) ?? ""
        }
    }
    
    var password: String {
        set(newValue) {
            defaults.set(newValue, forKey: Constants.Keys.password)
            defaults.synchronize()
        }
        get {
            return defaults.string(forKey: Constants.Keys.password) ?? ""
        }
    }
    
}

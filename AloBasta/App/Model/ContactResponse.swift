//
//  ContactResponse.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import Foundation

// MARK: - ContactResponseElement
struct ContactResponseElement: Codable {
    let id: Int?
    let firstName, lastName: String?
    let profilePic: String?
    let favorite: Bool?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case profilePic = "profile_pic"
        case favorite, url
    }
}

typealias ContactResponse = [ContactResponseElement]

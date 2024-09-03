//
//  UpdateData.swift
//  Example
//
//  Created by Yonghwi on 8/30/24.
//

import Foundation

struct UpdateData: Codable {
    let lastName: String
}

struct SignInParam: Codable {
    let username: String
    let password: String
}

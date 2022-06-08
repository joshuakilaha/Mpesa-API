//
//  Constants.swift
//  Mpesa API
//
//  Created by mroot on 02/06/2022.
//

import Foundation

enum NetworkError: Error {
    case invalideUrl
    case invalidResponse
    case invalideData
}
enum Basic {
   static let username = "QxKFkEA8ec3BXieWuN7fhWFFeDDgkPUz"
    static let password = "Of1X4b6Is0PrEiR1"
}

enum AuthToken {
    static let token = UserDefaults.standard.string(forKey: "access_token")
}

//
//  Token.swift
//  Mpesa API
//
//  Created by mroot on 02/06/2022.
//

import Foundation
/*
 "access_token": "uATvDAQK6OzgJ0hAny8jtL9SEqjD",
 "expires_in": "3599"
 */
struct Token: Codable {
    let access_token: String
    let expires_in: String
}

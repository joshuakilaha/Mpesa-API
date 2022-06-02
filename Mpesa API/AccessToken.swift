//
//  AccessToken.swift
//  Mpesa API
//
//  Created by mroot on 02/06/2022.
//

import Foundation

@MainActor
class AccessToken: ObservableObject {
    func generateToken(client_credentials: String) async throws {
        //query components
        var components = URLComponents()
        components.scheme = "https"
        components.host = "sandbox.safaricom.co.ke"
        components.path = "/oauth/v1/generate"
        components.queryItems = [
        URLQueryItem(name: "grant_type", value: "\(client_credentials)")
        ]
    
        guard let url = components.url else {
            throw NetworkError.invalideUrl
        }
        print(url)
        let auth = (Basic.username + ":" + Basic.password).data(using: .utf8)!.base64EncodedString()
        var request = URLRequest(url: url)
        request.setValue("Basic \(auth)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        //URL Session
        let (data, _) = try await URLSession.shared.data(for: request)
        //get JSON Response Body
        let decodedData = try JSONDecoder().decode(Token.self, from: data)
        print(decodedData.access_token)
        let token = decodedData.access_token
        //save token
        UserDefaults.standard.set(token, forKey: "access_token")
    }
}

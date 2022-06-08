//
//  OnlinePaymentService.swift
//  Mpesa API
//
//  Created by mroot on 02/06/2022.
//

import Foundation
@MainActor
class OnlinePaymentService: ObservableObject {
    func simulateC2B(paramenter: Parameters) async throws {
     //stkpush URL
        guard let url = URL(string: "https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest") else {
            throw NetworkError.invalideUrl
        }
        //encode paramenter
        //let auth = (Basic.username + ":" + Basic.password).data(using: .utf8)!.base64EncodedString()
        //let postData = parameters.data(using: .utf8)
        guard let parametersEncoded = try? JSONEncoder().encode(paramenter) else {
            throw NetworkError.invalideData
        }
        //get Request
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        //pass headers
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(AuthToken.token!)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "POST"
        request.httpBody = parametersEncoded
        //URL Session
        let (data, _) = try await URLSession.shared.upload(for: request, from: parametersEncoded)
        //get JSON Decoded Data
        let decodedResponse = try JSONDecoder().decode(res.self, from: data)
        print(decodedResponse)
    }
    
    func simulateC2B1(time: String) async throws {
     //stkpush URL
        guard let url = URL(string: "https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest") else {
            throw NetworkError.invalideUrl
        }
        
        let password = (Basic.username + "bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919" + time ).data(using: .utf8)!.base64EncodedString()
        print(password)
        let parameters: [String: Any] = [
            
              "BusinessShortCode": 174379,
              "Password": "\(password)",
              "Timestamp": time,
              "TransactionType": "CustomerPayBillOnline",
              "Amount": 1,
              "PartyA": 600992,
              "PartyB": 174379,
              "PhoneNumber": 254790457258,
              "CallBackURL": "https://mydomain.com/path",
              "AccountReference": "CompanyXLTD",
              "TransactionDesc": "Payment of X"
        ]
        //encode paramenter
       // let business = paramenter.businessShortCode
//        guard let parametersEncoded = try? JSONEncoder().encode(parameters) else {
//            throw NetworkError.invalideData
//        }
        do {
            print(time)
        let parametersEncoded = try JSONSerialization.data(withJSONObject: parameters)
        //get Request
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        //pass headers
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(AuthToken.token!)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "POST"
        request.httpBody = parametersEncoded
            print(AuthToken.token!)
        //URL Session
        let (data, _) = try await URLSession.shared.upload(for: request, from: parametersEncoded)
        //get Response
        //get JSON Decoded Data
        let decodedResponse = try JSONDecoder().decode(res.self, from: data)
        print(decodedResponse)
        } catch {
            print(error)
        }
    }
}

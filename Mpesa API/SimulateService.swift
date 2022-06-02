//
//  SimulateService.swift
//  Mpesa API
//
//  Created by mroot on 02/06/2022.
//

import Foundation

class SimulateService: ObservableObject {  
    func simulateC2B(paramenter: Parameters) async throws {
     //stkpush URL
        guard let url = URL(string: "https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest") else {
            throw NetworkError.invalideUrl
        }
        //encode paramenter
        print(paramenter.ShortCode)
        guard let parametersEncoded = try? JSONEncoder().encode(paramenter) else {
            throw NetworkError.invalideData
        }
        //get Request
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        //pass headers
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer qBRYGu4KgJit3NGAFAgQomFbIPyz", forHTTPHeaderField: "Authorization")
        request.httpMethod = "POST"
        request.httpBody = parametersEncoded
        //URL Session
        let (data, _) = try await URLSession.shared.upload(for: request, from: parametersEncoded)
        //get JSON Decoded Data
        let decodedResponse = try JSONDecoder().decode(Parameters.self, from: data)
        print(decodedResponse)
    }
}

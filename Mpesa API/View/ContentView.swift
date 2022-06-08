//
//  ContentView.swift
//  Mpesa API
//
//  Created by mroot on 02/06/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var accessTokenService = AccessToken()
    @ObservedObject var onlinePaymentService = OnlinePaymentService()
    @ObservedObject var paramenter: Parameters
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("Phone Number", value: $paramenter.PhoneNumber, formatter: NumberFormatter())
                    Button {
                        Task {
                            await token()
                            await simulateTransaction()
                        }
                    } label: {
                        Text("Get Token")
                    }
                }
            }
        }
    }
    //TimeStamp
    func generateCurrentTimeStamp () -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMddhhmmss"
        return (formatter.string(from: Date()) as NSString) as String
    }
    //get OAuth Token
    func token() async {
        do {
            let credential = "client_credentials"
            try await accessTokenService.generateToken(client_credentials: credential)
        } catch {
            print(error)
        }
    }
    func simulateTransaction() async {
        do {
           // try await onlinePaymentService.simulateC2B1(time: generateCurrentTimeStamp())
            let password = "\(Basic.username)bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919\(generateCurrentTimeStamp())".data(using: .utf8)!.base64EncodedString()
            print("Password: \(password)")
            paramenter.Password = password
            paramenter.Timestamp = generateCurrentTimeStamp()
            try await onlinePaymentService.simulateC2B(paramenter: paramenter)
        } catch {
            print(error)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(paramenter: Parameters())
    }
}

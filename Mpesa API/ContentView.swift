//
//  ContentView.swift
//  Mpesa API
//
//  Created by mroot on 02/06/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var simulateService = SimulateService()
    @ObservedObject var accessTokenService = AccessToken()
    @ObservedObject var parameter: Parameters
    var phoneNumber: Int = 0
    
    var body: some View {
        VStack {
            Text("\(parameter.ShortCode)")
            TextField("Phone Number", value: $parameter.PhoneNumber, formatter: NumberFormatter())
            Text(currentTimeStamp())
            Button {
                Task {
                   // await simulateTransaction()
                    await token()
                }
            } label: {
                Text("Simulate")
            }
        }
    }
    func currentTimeStamp() -> String {
        let date = Date()
        let calender = Calendar.current
        let day = calender.component(.day, from: date)
        let month = calender.component(.month, from: date)
        let year = calender.component(.year, from: date)
        let hour = calender.component(.hour, from: date)
        let minute = calender.component(.minute, from: date)
        let second = calender.component(.second, from: date)
        let timeStamp = "\(year)\(month)\(day)\(hour)\(minute)\(second)"
        return timeStamp
    }
    func simulateTransaction() async {
        do {
            parameter.PhoneNumber = phoneNumber
            parameter.Timestamp = currentTimeStamp()
            try await simulateService.simulateC2B(paramenter:parameter)
        } catch {
            print(error)
        }
    }
    func token() async {
        do {
            let credential = "client_credentials"
            try await accessTokenService.generateToken(client_credentials: credential)
        } catch {
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(parameter: Parameters())
    }
}

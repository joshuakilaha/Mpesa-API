//
//  ContentView.swift
//  Mpesa API
//
//  Created by mroot on 02/06/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var accessTokenService = AccessToken()
    var body: some View {
        Button {
            Task {
                await token()
            }
        } label: {
            Text("Get Token")
        }

    }
    //get OAuth Token
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
        ContentView()
    }
}

//
//  Paramenter.swift
//  Mpesa API
//
//  Created by mroot on 02/06/2022.
//

import Foundation

/*
 "BusinessShortCode": 174379,
 "Password": "MTc0Mzc5YmZiMjc5ZjlhYTliZGJjZjE1OGU5N2RkNzFhNDY3Y2QyZTBjODkzMDU5YjEwZjc4ZTZiNzJhZGExZWQyYzkxOTIwMjIwNjAyMTc0MjQ0",
 "Timestamp": "20220602174244",
 "TransactionType": "CustomerPayBillOnline",
 "Amount": 1,
 "PartyA": 254708374149,
 "PartyB": 174379,
 "PhoneNumber": 254708374149,
 "CallBackURL": "https://mydomain.com/path",
 "AccountReference": "CompanyXLTD",
 "TransactionDesc": "Payment of X"
 */

class Parameters: Codable, ObservableObject, Identifiable {
    enum CodingKeys: CodingKey {
        case ShortCode
        case Password
        case Timestamp
        case TransactionType
        case Amount
        case PartyA
        case PartyB
        case PhoneNumber
        case CallBackURL
        case AccountReference
        case TransactionDesc
    }

    @Published var ShortCode: Int = 174379
    @Published var Password = "MTc0Mzc5YmZiMjc5ZjlhYTliZGJjZjE1OGU5N2RkNzFhNDY3Y2QyZTBjODkzMDU5YjEwZjc4ZTZiNzJhZGExZWQyYzkxOTIwMjIwNjAyMTc0MjQ0"
    @Published var Timestamp = ""
    @Published var TransactionType = "CustomerPayBillOnline"
    @Published var Amount: Int = 1
    @Published var PartyA: Int = 254708374149
    @Published var PartyB: Int = 174379
    @Published var PhoneNumber: Int = 0
    @Published var CallBackURL = "https://mydomain.com/path"
    @Published var AccountReference = "CompanyXLTD"
    @Published var TransactionDesc = "Payment of X"
    
    init() {
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
    
        ShortCode = try container.decode(Int.self, forKey: .ShortCode)
        Password = try container.decode(String.self, forKey: .Password)
        Timestamp = try container.decode(String.self, forKey: .Timestamp)
        TransactionType = try container.decode(String.self, forKey: .TransactionType)
        Amount = try container.decode(Int.self, forKey: .Amount)
        PartyA = try container.decode(Int.self, forKey: .PartyA)
        PartyB = try container.decode(Int.self, forKey: .PartyB)
        PhoneNumber = try container.decode(Int.self, forKey: .PhoneNumber)
        CallBackURL = try container.decode(String.self, forKey: .CallBackURL)
        AccountReference = try container.decode(String.self, forKey: .AccountReference)
        TransactionDesc = try container.decode(String.self, forKey: .TransactionDesc)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(ShortCode, forKey: .ShortCode)
        try container.encode(Password, forKey: .Password)
        try container.encode(Timestamp, forKey: .Timestamp)
        try container.encode(Amount, forKey: .Amount)
        try container.encode(TransactionType, forKey: .TransactionType)
        try container.encode(PartyA, forKey: .PartyA)
        try container.encode(PartyB, forKey: .PartyB)
        try container.encode(PhoneNumber, forKey: .PhoneNumber)
        try container.encode(CallBackURL, forKey: .CallBackURL)
        try container.encode(AccountReference, forKey: .AccountReference)
        try container.encode(TransactionDesc, forKey: .TransactionDesc)
    }
}

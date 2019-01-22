//
//  SignInService.swift
//  CogniChallenge
//
//  Created by Felix Changoo on 1/19/19.
//  Copyright © 2019 Felix Changoo. All rights reserved.
//

import UIKit

class SignInService: SignInServiceProtocol {
    func signIn(endpoint: String, name: String, email: String, token: String?, with completionHandler: @escaping completion) {
        let json: [String: Any] = ["name": "\(name)",
                                   "email": "\(email)"]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        let url = URL(string: endpoint)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        print("endpoint is \(endpoint)")
        if let passedInToken = token {
            request.setValue(passedInToken, forHTTPHeaderField: "Token")
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse else {
                completionHandler(nil)
                return
            }
            
            guard let recievedToken = response.allHeaderFields["Token"] as? String else {
                completionHandler(nil)
                return
            }
            
            completionHandler(recievedToken)
        }
        task.resume()
    }
}

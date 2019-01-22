//
//  SignInProtocols.swift
//  CogniChallenge
//
//  Created by Felix Changoo on 1/19/19.
//  Copyright © 2019 Felix Changoo. All rights reserved.
//

import UIKit

protocol SignInViewDelegate {
    func onLoginSuccess(user: User)
    func onLoginFailure(with message: String)
}

protocol SignInServiceProtocol {
    typealias completion = (String?) -> ()
    
    func signIn(endpoint: String, name: String,
                email: String, token: String?, with completionHandler: @escaping completion)
}
    

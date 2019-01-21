//
//  LoginPresenter.swift
//  CogniChallenge
//
//  Created by Felix Changoo on 1/19/19.
//  Copyright © 2019 Felix Changoo. All rights reserved.
//

import Foundation

enum FailureMessages: String  {
    case invalidNameOrEmail = "No Name or Email entered"
    case trySignInAgain = "Seems like your already registered. Please hit sign in again"
    case badRequest = "A bad request was made to the server"
}

class SignInPresenter {
    var view: SignInViewDelegate
    var service: SignInServiceProtocol
    var user: User?
    
    init(view: SignInViewDelegate, service: SignInServiceProtocol) {
        self.view = view
        self.service = service
    }
    
    func performLogin(name: String?, email: String?) {
        guard let name = name, let email = email else {
            view.onLoginFailure(with: FailureMessages.invalidNameOrEmail.rawValue)
            return
        }
    
        let usersEndpoint = Endpoints.SignIn.users.url

        if let user = user {
            view.onLoginSuccess(user: user)
        } else {
            attemptLogin(endpoint: usersEndpoint, name: name, email: email)
        }
    }
    
    private func attemptLogin(endpoint: String, name: String, email: String) {
        service.signIn(endpoint: endpoint, name: name, email: email) { [weak self] recievedToken in
            guard let strongSelf = self else { return }
            
            DispatchQueue.main.sync {
                if let recievedToken = recievedToken {
                    strongSelf.updateUser(name: name, email: email, token: recievedToken)
                    strongSelf.view.onLoginSuccess(user: strongSelf.user!)
                } else {
                    strongSelf.view.onLoginFailure(with: FailureMessages.badRequest.rawValue)
                }
            }
        }
    }
    
    private func updateUser(name: String, email: String, token: String) {
        user = User(name: name, email: email, token: token)
    }
}

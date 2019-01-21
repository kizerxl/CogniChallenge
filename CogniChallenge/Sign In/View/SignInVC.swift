//
//  ViewController.swift
//  CogniChallenge
//
//  Created by Felix Changoo on 1/19/19.
//  Copyright © 2019 Felix Changoo. All rights reserved.
//

import UIKit

class SignVC: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    var signInPresenter: SignInPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

    @IBAction func logInButtonTapped(_ sender: Any) {
        let name = nameTextField.text
        let email = emailTextField.text
        
        signInPresenter.performLogin(name: name, email: email)
    }
    
    func setupView() {
        let service = SignInService()
        signInPresenter = SignInPresenter(view: self, service: service)
    }
    
    private func presentAlertMessage(message: String) {
        let alert = UIAlertController(title: "Login Failed", message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
    
        self.present(alert, animated: true, completion: nil)
    }
}

extension SignVC: SignInViewDelegate {
    func onLoginSuccess(user: User) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(withIdentifier: "Map") as! VenuesVC
        controller.user = user
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func onLoginFailure(with message: String) {
        presentAlertMessage(message: message)
    }
}


//
//  ViewController.swift
//  UserLoginProtocolOriented
//
//  Created by Atil Samancioglu on 16.09.2022.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .green
    }
    
    func processFlow() {
        
        if let accessToken = UserDefaults.standard.string(forKey: "ACCESS_TOKEN"), !accessToken.isEmpty {
            showMainApp()
        } else {
            showLogin()
        }
        
    }
    
    func showMainApp() {
        let mainViewController = MainViewController()
        navigationController?.present(mainViewController, animated: true)

    }

    func showLogin() {
        let loginViewController = LoginViewController()
        navigationController?.present(loginViewController, animated: true)
    }

}


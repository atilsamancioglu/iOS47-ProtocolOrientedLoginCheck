//
//  ViewController.swift
//  UserLoginProtocolOriented
//
//  Created by Atil Samancioglu on 16.09.2022.
//

import UIKit

class RootViewController: UIViewController, RootViewModelOutput {
    
    private let viewModel : RootViewModel
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .green
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.checkLogin()
    }
    
    init(viewModel: RootViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.output = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    
    func checkLogin() {
        
        if let accessToken = UserDefaults.standard.string(forKey: "ACCESS_TOKEN"), !accessToken.isEmpty {
            showMainApp()
        } else {
            showLogin()
        }
        
    }
     */
    
   
    func showMainApp() {
        let mainViewController = MainViewController()
        if let window = UIApplication.shared.keyWindow {
            let navigationVC = UINavigationController(rootViewController: mainViewController)
            window.rootViewController = navigationVC
         }

        //navigationController?.pushViewController(mainViewController, animated: true)
        //navigationController?.present(mainViewController, animated: true)

    }

    func showLogin() {
        let loginViewController = LoginViewController()
        if let window = UIApplication.shared.keyWindow {
           let navigationVC = UINavigationController(rootViewController: loginViewController)
           window.rootViewController = navigationVC
        }
        //navigationController?.pushViewController(loginViewController,animated: true)
        //navigationController?.present(loginViewController, animated: true)
    }
    
    
}



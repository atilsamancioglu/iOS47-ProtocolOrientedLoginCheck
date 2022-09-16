//
//  RootViewModel.swift
//  UserLoginProtocolOriented
//
//  Created by Atil Samancioglu on 16.09.2022.
//

import Foundation

class RootViewModel {
    
    private let loginStorageService : LoginStorageService //this is regular interface protocol pattern
     
    weak var output : RootViewModelOutput? //this is delegate pattern
    
    init(loginStorageService: LoginStorageService) {
        self.loginStorageService = loginStorageService
    }
        
    func checkLogin() {
        
        if let accessToken = loginStorageService.getUserAccessToken(), !accessToken.isEmpty {
            //user logged in
            output?.showMainApp()
        } else {
            //user not logged in
            output?.showLogin()
        }
        
        /*
        if let accessToken = UserDefaults.standard.string(forKey: "ACCESS_TOKEN"), !accessToken.isEmpty {
            //showMainApp()
        } else {
            //showLogin()
        }
         */
    }
    
}

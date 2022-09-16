//
//  LoginStorageService.swift
//  UserLoginProtocolOriented
//
//  Created by Atil Samancioglu on 16.09.2022.
//

import Foundation

protocol LoginStorageService {
    var userAccessTokenKey : String { get } 
    func setUserAccessToken(token: String)
    func getUserAccessToken() -> String?
}

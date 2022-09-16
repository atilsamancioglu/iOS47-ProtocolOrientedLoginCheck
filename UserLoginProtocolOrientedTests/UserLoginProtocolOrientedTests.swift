//
//  UserLoginProtocolOrientedTests.swift
//  UserLoginProtocolOrientedTests
//
//  Created by Atil Samancioglu on 16.09.2022.
//

import XCTest
@testable import UserLoginProtocolOriented

final class UserLoginProtocolOrientedTests: XCTestCase {
    
    private var sut : RootViewModel!
    private var loginStorageService : MockLoginStorageService!
    private var output : MockRootViewModelOutput!

    override func setUpWithError() throws {
        
        loginStorageService = MockLoginStorageService()
        output = MockRootViewModelOutput()
        
        sut = RootViewModel(loginStorageService: loginStorageService)
        sut.output = output
    }

    override func tearDownWithError() throws {
        sut = nil
        loginStorageService = nil
    }

    func testShowLogin_whenLoginStorageReturnsEmptyUserAccessToken() throws {
        //given
        loginStorageService.storage = [:] //No access token
        //when
        sut.checkLogin()
        //then
        XCTAssertEqual(output.check.count, 1)
        XCTAssertEqual(output.check.first, .login)
            
    }
    
    func testShowMainApp_whenLoginStorageReturnsUserAccessToken() throws {
        //given
        loginStorageService.storage["ACCESS_TOKEN"] = "12312" //random token to mock actual token
        //when
        sut.checkLogin()
        //then
        XCTAssertEqual(output.check.count, 1)
        XCTAssertEqual(output.check.first, .mainApp)
            
    }

}


class MockLoginStorageService : LoginStorageService {
    
    var userAccessTokenKey: String {
        return "ACCESS_TOKEN"
    }
    
    var storage : [String : String] = [:]
    
    func setUserAccessToken(token: String) {
        storage[userAccessTokenKey] = token
    }
    
    func getUserAccessToken() -> String? {
        return storage[userAccessTokenKey]
    }
    
    
}

class MockRootViewModelOutput : RootViewModelOutput {
    
    enum Check {
        case login
        case mainApp
    }
    
    var check : [Check] = []
    
    func showLogin() {
        check.append(.login)
    }
    
    func showMainApp() {
        check.append(.mainApp)
    }
    
    
}

//
//  AuthPresenterTest.swift
//  task3Tests
//
//  Created by mac on 18.04.2021.
//

import XCTest
@testable import task3

class MockView: AuthViewProtocol {
    func showError(text: String) {
    }
}

class AuthPresenterTest: XCTestCase {
    var view: MockView!
    var presenter: AuthPresenter!
    var router: AuthRouter!
    var navController = UINavigationController()
    
    override func setUpWithError() throws {
        view = MockView()
        router = AuthRouter(navigationController: navController)
        presenter = AuthPresenter(view: view, router: router)
    }

    override func tearDownWithError() throws {
        view = nil
        router = nil
        presenter = nil
    }
    
    func testCheckAuthModuleIsNotNil() {
        XCTAssertNotNil(view, "view not nil")
        XCTAssertNotNil(presenter, "presenter not nil")
        XCTAssertNotNil(router, "router not nil")
    }
}


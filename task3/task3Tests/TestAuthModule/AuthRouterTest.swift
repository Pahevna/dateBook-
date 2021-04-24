//
//  AuthRouterTest.swift
//  task3Tests
//
//  Created by mac on 18.04.2021.
//

import XCTest
@testable import task3

class MockNavigationController: UINavigationController {
    var presentedVC: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.presentedVC = viewController
        super.pushViewController(viewController, animated: animated)
    }
}

class AuthRouterTest: XCTestCase {
    var router: AuthRouterProtocol!
    var navigationController = MockNavigationController()

    override func setUpWithError() throws {
        router = AuthRouter(navigationController: navigationController)
    }

    override func tearDownWithError() throws {
        router = nil
    }
    
    func testAuthRouter() {
        router.showListNews()
        let listNewsViewController = navigationController.presentedVC
        XCTAssertTrue(listNewsViewController is ListNewsViewController)
        
    }
}

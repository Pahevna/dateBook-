//
//  EventListRouterTest.swift
//  dateBookTests
//
//  Created by mac on 09.01.2022.
//

import XCTest
@testable import dateBook

class MockNavigationController: UINavigationController {
    var presentedVC: UIViewController?

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.presentedVC = viewController
        super.pushViewController(viewController, animated: animated)
    }
}

class EventListRouterTest: XCTestCase {
    var router: EventListRouterProtocol!
    var navigationController = MockNavigationController()

    override func setUpWithError() throws {
        router = EventListRouter(navigationController: navigationController)
    }

    override func tearDownWithError() throws {
        router = nil
    }

    func testEventListRouter() {
        router.showEventCreationModule()
        let eventCreationViewController = navigationController.presentedVC
        XCTAssertTrue(eventCreationViewController is EventCreationViewController)
    }
}

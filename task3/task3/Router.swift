//
//  Router.swift
//  task3
//
//  Created by mac on 26.01.2021.
//

import UIKit

//protocol RouterMain {
//    var navigationController: UINavigationController? { get set }
//    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
//}

//protocol RouterProtocol: RouterMain {
//    func initialViewController()
//    func showDetail()
//}
//
//class Router: RouterProtocol {
//    var navigationController: UINavigationController?
//    var assemblyBuilder: AssemblyBuilderProtocol?
//
//    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol) {
//        self.navigationController = navigationController
//        self.assemblyBuilder = assemblyBuilder
//    }
//
//    func initialViewController() {
//        if let navigationController = navigationController {
//            guard let mainViewController = assemblyBuilder?.createSignInModule(router: self) else { return }
//            navigationController.viewControllers = [mainViewController]
//        }
//    }
//
//    func showDetail() {
//        if let navigationController = navigationController {
//            guard let detailViewController = assemblyBuilder?.createDetailModule(router: self) else { return }
//            navigationController.pushViewController(detailViewController, animated: true)
//        }
//    }
//}

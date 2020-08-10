//
//  FirstCoordinator.swift
//  Coordinator
//
//  Created by Daniel Salhuana Rojas on 8/10/20.
//  Copyright © 2020 TestBcp. All rights reserved.
//

import UIKit

class FirstCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    
    var identifier: String = "FirstCoordinator"
    var childCoordinators = [Coordinator]()
    var navigationController: BaseNavigationController
    var swipeBack: Bool = false { didSet { parentCoordinator?.swipeBack = swipeBack
    } }
    
    init(navigationController: BaseNavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let firstViewController: FirstViewController = .instantiate()
        firstViewController.coordinator = self
        navigationController.pushViewController(firstViewController, animated: true)
    }
}

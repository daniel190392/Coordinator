//
//  MainCoordinator.swift
//  Coordinator
//
//  Created by Daniel Salhuana Rojas on 8/10/20.
//  Copyright © 2020 TestBcp. All rights reserved.
//

import UIKit

class MainCoordinator:  NSObject, Coordinator {
    var identifier: String = "MainCoordinator"
    var childCoordinators = [Coordinator]()
    var navigationController: BaseNavigationController
    var swipeBack: Bool = false { didSet { navigationController.interactivePopGestureRecognizer?.isEnabled = swipeBack
        } }
    
    init(navigationController: BaseNavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeViewController: HomeViewController = .instantiate()
        homeViewController.coordinator = self
        navigationController.pushViewController(homeViewController, animated: true)
        navigationController.delegate = self
        navigationController.interactivePopGestureRecognizer?.delegate = self
    }
    
    func firstView() {
        let firstChild = FirstCoordinator(navigationController: navigationController)
        firstChild.parentCoordinator = self
        childCoordinators.append(firstChild)
        firstChild.start()
    }
    
    func secondView() {
        let secondViewController: SecondViewController = .instantiate()
        secondViewController.coordinator = self
        navigationController.pushViewController(secondViewController, animated: true)
    }
    
    func didFinishChild(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator.identifier == child?.identifier {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}

extension MainCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        if let firstViewController = fromViewController as? FirstViewController {
            didFinishChild(firstViewController.coordinator)
        }
    }
}

extension MainCoordinator: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard let _ = navigationController.interactivePopGestureRecognizer else { return true }
        return swipeBack && navigationController.viewControllers.count > 1
    }
}

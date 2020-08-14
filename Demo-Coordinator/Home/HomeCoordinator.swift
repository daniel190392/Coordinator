//
//  HomeCoordinator.swift
//  Demo-Coordinator
//
//  Created by Javier Fuentes Huertas on 8/10/20.
//  Copyright © 2020 TestBcp. All rights reserved.
//
import UIKit

protocol HomeCoordinatorProtocol: Coordinator {
    
    func goToFirstViewController()
    func goToSecondViewController()
    func callModalController()
    
}

class HomeCoordinator: HomeCoordinatorProtocol {
   
        
    var parent: Coordinator?
    var children: [Coordinator] = []
    var router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func start(animated: Bool, onDismissed: (() -> Void)?) {
        let viewController: HomeViewController = .instantiate()
        viewController.coordinator = self
        router.push(viewController, animated: true)
    }
    
    func goToFirstViewController() {
        let firstCoordinator = FirstCoordinator(router)
        addChild(firstCoordinator, animated: true)
    }
    
    func goToSecondViewController() {
        let secondCoordinator = SecondCoordinator(router)
        addChild(secondCoordinator, animated: true)
    }
    
    func callModalController() {
        let navigationController = UINavigationController()
        let navRouter = NavigationRouter(navigationController: navigationController)
        let coordinator = ModalCoordinator(router: navRouter)
        
        coordinator.onDismiss =  { [weak self] in
            self?.router.dismissModule(animated: true, completion: nil)
            self?.removeChild(coordinator)
        }
        
        addChild(coordinator, animated: true)
        router.present(navigationController, animated: true)
    }
    
}

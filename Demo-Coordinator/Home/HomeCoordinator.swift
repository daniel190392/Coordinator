//
//  HomeCoordinator.swift
//  Demo-Coordinator
//
//  Created by Javier Fuentes Huertas on 8/10/20.
//  Copyright © 2020 TestBcp. All rights reserved.
//

protocol HomeCoordinatorProtocol: Coordinator {
    
    func goToFirstViewController()
    func goToSecondViewController()
    
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
        router.present(viewController, animated: true)
    }
    
    func goToFirstViewController() {
        let firstCoordinator = FirstCoordinator(router)
        addChild(firstCoordinator, animated: true)
    }
    
    func goToSecondViewController() {
        let secondCoordinator = SecondCoordinator(router)
        addChild(secondCoordinator, animated: true)
    }
    
}

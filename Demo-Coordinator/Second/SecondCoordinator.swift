//
//  SecondCoordinator.swift
//  Demo-Coordinator
//
//  Created by Javier Fuentes Huertas on 8/11/20.
//  Copyright © 2020 TestBcp. All rights reserved.
//

protocol SecondCoordinatorProtocol: Coordinator {
    
}

class SecondCoordinator: SecondCoordinatorProtocol {

    var parent: Coordinator?
    var children: [Coordinator] = []
    var router: Router
    
    init(_ router: Router) {
        self.router = router
    }
    
    func start(animated: Bool, onDismissed: (() -> Void)?) {
        let secondViewController: SecondViewController = .instantiate()
        router.push(secondViewController, animated: true, onDismissed: onDismissed)
    }
    
}

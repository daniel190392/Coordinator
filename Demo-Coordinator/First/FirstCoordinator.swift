//
//  FirstCoordinator.swift
//  Demo-Coordinator
//
//  Created by Javier Fuentes Huertas on 8/10/20.
//  Copyright © 2020 TestBcp. All rights reserved.
//

class FirstCoordinator: Coordinator {
    
    var parent: Coordinator?
    var children: [Coordinator] = []
    var router: Router
    
    init(_ router: Router) {
        self.router = router
    }
    
    func start(animated: Bool, onDismissed: (() -> Void)?) {
        let firstViewController: FirstViewController = .instantiate()
        router.present(firstViewController, animated: true, onDismissed: onDismissed)
    }
    
    
}

//
//  AppCoordinator.swift
//  Demo-Coordinator
//
//  Created by Javier Fuentes Huertas on 8/10/20.
//  Copyright © 2020 TestBcp. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var parent: Coordinator?
    var children: [Coordinator] = []
    var router: Router
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window  = window
        parent = nil // Root Controller hasn't parent
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        router = NavigationRouter(navigationController: navigationController)
    }
    
    func start(animated: Bool, onDismissed: (() -> Void)? = nil) {
        let coordinator = HomeCoordinator(router: router)
        addChild(coordinator, animated: true)
    }
    
}

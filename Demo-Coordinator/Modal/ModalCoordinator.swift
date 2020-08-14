//
//  ModalCoordinator.swift
//  Demo-Coordinator
//
//  Created by Daniel Salhuana Rojas on 8/14/20.
//  Copyright © 2020 TestBcp. All rights reserved.
//

import UIKit

protocol CoordinatorModal: Coordinator {
    
}

class ModalCoordinator: Coordinator {
    var parent: Coordinator?
    
    var children: [Coordinator] = []
    
    var router: Router
    
    lazy var modalController: ModalViewController = {
        var modalController: ModalViewController = .instantiate()
        modalController.delegate = self
        return modalController
    }()
    
    
    var onDismiss: (() -> Void)?
    
    init(router: Router) {
        self.router = router
        router.setRootModule(modalController, hideBar: true)
    }
    
    func start(animated: Bool, onDismissed: (() -> Void)?) {
    }

}

extension ModalCoordinator: ViewControllerDelegate {
    
    func controllerPressButton(_ controller: UIViewController) {
        onDismiss?()
    }
    
}

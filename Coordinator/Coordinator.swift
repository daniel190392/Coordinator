//
//  Coordinator.swift
//  Coordinator
//
//  Created by Daniel Salhuana Rojas on 8/10/20.
//  Copyright © 2020 TestBcp. All rights reserved.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] {get set}
    var navigationController: BaseNavigationController {get set}
    var identifier: String { get set }
    
    func start()
}

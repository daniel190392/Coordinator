//
//  SecondViewController.swift
//  Coordinator
//
//  Created by Daniel Salhuana Rojas on 8/10/20.
//  Copyright © 2020 TestBcp. All rights reserved.
//

import UIKit

class SecondViewController: BaseViewController {
    
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coordinator?.swipeBack = true
        title = "second"
        // Do any additional setup after loading the view.
    }
}

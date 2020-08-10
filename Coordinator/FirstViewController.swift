//
//  FirstViewController.swift
//  Coordinator
//
//  Created by Daniel Salhuana Rojas on 8/10/20.
//  Copyright © 2020 TestBcp. All rights reserved.
//

import UIKit

class FirstViewController: BaseViewController {
    
    weak var coordinator: FirstCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "first"
        
        coordinator?.swipeBack = false
        // Do any additional setup after loading the view.
    }

}

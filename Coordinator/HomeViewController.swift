//
//  ViewController.swift
//  Coordinator
//
//  Created by Daniel Salhuana Rojas on 8/10/20.
//  Copyright © 2020 TestBcp. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "home"
        view.backgroundColor = .white
    }
    
    @IBAction func onTapFirst(_ sender: Any) {
        coordinator?.firstView()
    }
    
    @IBAction func onTapSecond(_ sender: Any) {
        coordinator?.secondView()
    }
}


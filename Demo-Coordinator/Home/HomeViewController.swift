//
//  ViewController.swift
//  Coordinator
//
//  Created by Daniel Salhuana Rojas on 8/10/20.
//  Copyright © 2020 TestBcp. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var coordinator: HomeCoordinatorProtocol?
    
    @IBAction func onTapFirst(_ sender: Any) {
        coordinator?.goToFirstViewController()
    }
    
    @IBAction func onTapSecond(_ sender: Any) {
        coordinator?.goToSecondViewController()
    }
}


//
//  ModalViewController.swift
//  Demo-Coordinator
//
//  Created by Daniel Salhuana Rojas on 8/14/20.
//  Copyright © 2020 TestBcp. All rights reserved.
//

import UIKit

class ModalViewController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func onTapClose(_ sender: Any) {
        delegate?.controllerPressButton(self)
    }
}

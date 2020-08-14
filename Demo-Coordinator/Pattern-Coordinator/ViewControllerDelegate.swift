//
//  ViewControllerDelegate.swift
//  Demo-Coordinator
//
//  Created by Daniel Salhuana Rojas on 8/14/20.
//  Copyright © 2020 TestBcp. All rights reserved.
//

import UIKit

public protocol ViewControllerDelegate: class {
    func controllerPressButton(_ controller: UIViewController)
}

class BaseController: UIViewController {
    weak var delegate: ViewControllerDelegate?
}

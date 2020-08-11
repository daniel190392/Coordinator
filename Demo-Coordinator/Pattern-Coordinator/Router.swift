//
//  Router.swift
//  Demo-Coordinator
//
//  Created by Javier Fuentes Huertas on 8/10/20.
//  Copyright © 2020 TestBcp. All rights reserved.
//

import UIKit

public protocol Router: AnyObject {
    
    func present(_ viewController: UIViewController, animated: Bool)
    func present(_ viewController: UIViewController, animated : Bool, onDismissed: (()->Void)?)
    func dismiss(animated: Bool)
    
}

extension Router {
    
    public func present(_ viewController: UIViewController, animated: Bool) {
        present(viewController, animated: animated, onDismissed: nil)
    }
    
}

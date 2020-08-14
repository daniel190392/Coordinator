//
//  Router.swift
//  Demo-Coordinator
//
//  Created by Javier Fuentes Huertas on 8/10/20.
//  Copyright © 2020 TestBcp. All rights reserved.
//

import UIKit

public protocol Router: AnyObject {
    
    func setRootModule(_ viewController: UIViewController, hideBar: Bool)
    func present(_ viewController: UIViewController, animated: Bool)
    func push(_ viewController: UIViewController, animated: Bool)
    func push(_ viewController: UIViewController, animated : Bool, onDismissed: (()->Void)?)
    func dismissModule(animated: Bool, completion: (() -> Void)?)
    func dismiss(animated: Bool)
    
    
}

extension Router {
    
    public func push(_ viewController: UIViewController, animated: Bool) {
        push(viewController, animated: animated, onDismissed: nil)
    }
    
}

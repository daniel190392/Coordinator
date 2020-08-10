//
//  Storyboarded.swift
//  Coordinator
//
//  Created by Daniel Salhuana Rojas on 8/10/20.
//  Copyright © 2020 TestBcp. All rights reserved.
//

import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(identifier: className) as! Self
    }
}

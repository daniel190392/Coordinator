//
//  UIViewController+Extension.swift
//  Demo-Coordinator
//
//  Created by Javier Fuentes Huertas on 8/10/20.
//  Copyright © 2020 TestBcp. All rights reserved.
//

import UIKit

extension UIViewController {
    
    var swipeToPop: Bool {
        get { return navigationController?.interactivePopGestureRecognizer?.isEnabled ?? false }
        set {
            guard let interactivePopGestureRecognizer = navigationController?.interactivePopGestureRecognizer else { return }
            interactivePopGestureRecognizer.isEnabled = newValue
            interactivePopGestureRecognizer.delegate = self
        }
    }
    
    static func instantiate<T>() -> T {
        guard let storyboardName = String(describing: self).text(before: "ViewController") else { fatalError("The controller name is not standard.") }
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle(for: self))
        let identifier = String(describing: T.self)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("The storyboard identifier does not exist¿.")
        }
        return viewController
    }
    
}

extension String {
    
    func text(before text: String) -> String? {
        guard let range = self.range(of: text) else { return nil }
        return String(self[self.startIndex..<range.lowerBound])
    }
    
}

// MARK: - UIGestureRecognizerDelegate
extension UIViewController: UIGestureRecognizerDelegate {
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if swipeToPop,
            gestureRecognizer == navigationController?.interactivePopGestureRecognizer,
            navigationController?.viewControllers.count ?? 0 > 1 {
            return true
        }
        return false
    }
    
}


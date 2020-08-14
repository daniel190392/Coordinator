//
//  BaseRouter.swift
//  Demo-Coordinator
//
//  Created by Javier Fuentes Huertas on 8/10/20.
//

import UIKit

public class NavigationRouter: NSObject {
    
    private let navigationController: UINavigationController
    private let routerRootController: UIViewController?
    private var onDismissForViewController: [UIViewController: (() -> Void)] = [:]
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.routerRootController = navigationController.viewControllers.first
        super.init()
        self.navigationController.delegate = self
        self.navigationController.interactivePopGestureRecognizer?.isEnabled = false
    }
    
}

// MARK: - Router
extension NavigationRouter: Router {
    public func present(_ viewController: UIViewController, animated: Bool) {
        navigationController.present(viewController, animated: animated, completion: nil)
    }
    
    public func push(_ viewController: UIViewController, animated: Bool,onDismissed: (() -> Void)?) {
        onDismissForViewController[viewController] = onDismissed
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    public func dismiss(animated: Bool) {
        guard let routerRootController = routerRootController else {
            navigationController.popToRootViewController( animated: animated)
            return
        }
        performOnDismissed(for: routerRootController)
        navigationController.popToViewController( routerRootController, animated: animated)
    }
    
    public func dismissModule(animated: Bool, completion: (() -> Void)?) {
        navigationController.dismiss(animated: animated, completion: completion)
    }
    
    public func setRootModule(_ viewController: UIViewController, hideBar: Bool = false) {
        onDismissForViewController.forEach { $0.value() }
        navigationController.setViewControllers([viewController], animated: true)
        navigationController.isNavigationBarHidden = hideBar
    }
    
    private func performOnDismissed(for viewController: UIViewController) {
        guard let onDismiss = onDismissForViewController[viewController] else { return }
        onDismiss()
        onDismissForViewController.removeValue(forKey: viewController)
    }
    
}

// MARK: - UINavigationControllerDelegate
extension NavigationRouter: UINavigationControllerDelegate {
    
    public func navigationController(
        _ navigationController: UINavigationController,
        didShow viewController: UIViewController,
        animated: Bool
    ) {
        guard let dismissedViewController = navigationController.transitionCoordinator?.viewController(forKey: .from), !navigationController.viewControllers.contains(dismissedViewController) else { return }
        performOnDismissed(for: dismissedViewController)
    }
    
}

//
//  Coordinator.swift
//  Coordinator
//
//  Created by Daniel Salhuana Rojas on 8/10/20.
//  Copyright © 2020 TestBcp. All rights reserved.
//

protocol Coordinator: AnyObject {
    
    var parent: Coordinator? { get set }
    var children: [Coordinator] {get set}
    var router: Router { get }
    
    func start(animated: Bool, onDismissed: (() -> Void)?)
    func stop(animated: Bool)
    func addChild(_ child: Coordinator, animated: Bool, onDismissed: (() -> Void)?)
    func findChild(_ child: Coordinator) -> Coordinator?
    
}

extension Coordinator {
  
    public func stop(animated: Bool) {
        router.dismiss(animated: true)
    }
    
    public func addChild(_ child: Coordinator, animated: Bool, onDismissed: (() -> Void)? = nil) {
        child.parent = self
        children.append(child)
        child.start(animated: animated) { [weak self, weak child] in
            guard let self = self, let child = child else { return }
            self.removeChild(child)
            onDismissed?()
        }
    }
    
    public func removeChild(_ child: Coordinator) {
        guard let index = children.firstIndex(where: { $0 === child }) else { return }
        children.remove(at: index)
    }
    
    public func findChild(_ child: Coordinator) -> Coordinator? {
        return children.first { $0 === child }
    }
    
}

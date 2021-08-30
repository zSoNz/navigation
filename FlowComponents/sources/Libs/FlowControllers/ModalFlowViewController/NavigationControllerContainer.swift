//
//  NavigationControllerContainer.swift
//  Ketogenic
//
//  Created by Artem Chabannyi on 2/8/19.
//  Copyright © 2019 IDAP Group. All rights reserved.
//

import UIKit
import UIKitLib

import RxSwift
import RxCocoa

open class NavigationControllerContainer<Presenter: NavigationControllerPresenter, EventAction: FlowEventAction>: UIViewController, FlowViewControllerOutEvent, UINavigationControllerDelegate, UIGestureRecognizerDelegate {
    
    public typealias EventEmitter = Observable<EventAction>
    
    // MARK: - Public properties
    
    public var event: EventEmitter {
        return self.eventEmitter.asObserver()
    }
    
    public var topViewController: UIViewController? {
        return self.contentController.topViewController
    }
    
    public var visibleViewController: UIViewController? {
        return self.contentController.visibleViewController
    }
    
    public var viewControllers: [UIViewController] {
        return self.contentController.viewControllers
    }
    
    public let disposeBag = DisposeBag()
    
    // MARK: -
    // MARK: Internal
    
    internal var needHide = true

    // MARK: - Private methods
    
    private let eventEmitter = PublishSubject<EventAction>()
    
    public let presenter: Presenter
    
    public let contentController: UINavigationController
    
    // MARK: - Initializations and Deallocations
    
    public init(presenter: Presenter) {
        self.presenter = presenter
        let contentController = UINavigationController()
        self.contentController = contentController
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) not allowed.")
    }
    
    // MARK: - View Controller Lifecycle
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addContainerController()
    }
    
    // MARK: - Public methods
    
    public func send(action: EventAction) {
        self.eventEmitter.onNext(action)
    }
    
    public func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.contentController.pushViewController(viewController, animated: animated)
    }
    
    @discardableResult
    public func popViewController(animated: Bool) -> UIViewController? {
        return self.contentController.popViewController(animated: animated)
    }
    
    public func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
        self.contentController.setViewControllers(viewControllers, animated: animated)
    }
    
    @discardableResult
    public func popToRootViewController(animated: Bool) -> [UIViewController]? {
        return self.contentController.popToRootViewController(animated: animated)
    }
    
    @discardableResult
    public func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        return self.contentController.popToViewController(viewController, animated: animated)
    }
    
    public func pushViewController(_ viewController: UIViewController, popViewControllers: [UIViewController], animated: Bool) {
        let viewControllers = self.viewControllers.filter{ !popViewControllers.contains($0) } + [viewController]
        self.setViewControllers(viewControllers, animated: animated)
    }
    
    public func pushViewControllerOnTopOfRoot(_ viewController: UIViewController, animated: Bool) {
        let viewControllers = self.viewControllers.first.flatMap { [$0, viewController] } ?? [viewController]
        self.setViewControllers(viewControllers, animated: animated)
    }
    
    // MARK: - UINavigationControllerDelegate
    
    public func navigationController(_ navigationController: UINavigationController,
                                     animationControllerFor operation: UINavigationController.Operation,
                                     from fromVC: UIViewController,
                                     to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let controllerAnimatedTransitioning = self.presenter.controllerAnimatedTransitioning
        controllerAnimatedTransitioning?.updateAnimationState(for: operation)
        return controllerAnimatedTransitioning
    }
    
    public func navigationController(_ navigationController: UINavigationController,
                                     interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self.presenter.controllerInteractiveTransitioning
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if !self.needHide {
            self.needHide = true
            return false
        }
        
        let isRoot = self.topViewController == self.viewControllers.first
        let isTopNavigation = self.topViewController is NavigationControllerContainer
        
        if isRoot && !isTopNavigation {
            let parent = (self.navigationController?.parent as? NavigationControllerContainer)
            parent?.popViewController(animated: true)
            parent?.needHide = false
            
            return false
        }
        
        return self.viewControllers.count > 1 && (!isTopNavigation || isRoot)
    }
    
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        true
    }
    
    // MARK: - Private methods
    
    private func addContainerController() {
        let containerController = self.contentController
//        containerController.setNavigationBarHidden(true, animated: false)
        self.idp.addChild(childController: containerController)
        contentController.delegate = self
        contentController.interactivePopGestureRecognizer?.isEnabled = true
        contentController.interactivePopGestureRecognizer?.delegate = self
        
        contentController.interactivePopGestureRecognizer
            .map(self.view.addGestureRecognizer)
    }
}

//
//  NavigationFlowViewController.swift
//  Ketogenic
//
//  Created by Artem Chabannyi on 2/8/19.
//  Copyright © 2019 IDAP Group. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

open class NavigationFlowViewController<Presenter: NavigationControllerPresenter, EventAction: FlowEventAction>: UINavigationController, FlowViewControllerOutEvent, UINavigationControllerDelegate {
    
    public typealias EventEmitter = Observable<EventAction>
    
    // MARK: - Public properties
    
    public var event: EventEmitter {
        return self.eventEmitter.asObserver()
    }
    
    // MARK: - Private methods
    
    private let eventEmitter = PublishSubject<EventAction>()
    
    public let presenter: Presenter
    
    // MARK: - Initializations and Deallocations
    
    public init(presenter: Presenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        self.delegate = self
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) not allowed.")
    }
    
    // MARK: - Public methods
    
    public func send(action: EventAction) {
        self.eventEmitter.onNext(action)
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
}

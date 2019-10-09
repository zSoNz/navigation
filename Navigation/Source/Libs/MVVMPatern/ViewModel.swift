//
//  ViewModel.swift
//  Navigation
//
//  Created by IDAP Developer on 9/5/19.
//  Copyright © 2019 Bendis. All rights reserved.
//

import UIKit

import Configurators

import RxSwift
import RxCocoa

public enum ViewModelEvents {
    
    case didUpdated
}

open class ViewModel<ConfiguratorType: Configurator, EventsType: Events> {

    //MARK: -
    //MARK: Variables
    
    public let handler = PublishSubject<EventsType>()
    
    public var events: Observable<ViewModelEvents> {
        return self.eventsEmiter.asObservable()
    }
    
    internal let eventsEmiter = PublishSubject<ViewModelEvents>()
    internal let configurator: ConfiguratorType
    
    private let disposeBag = DisposeBag()
    
    //MARK: -
    //MARK: Initializations
    
    public init(with configurator: ConfiguratorType) {
        self.configurator = configurator
        
        self.prepareHandling()
    }
    
    //MARK: -
    //MARK: Private
    
    private func prepareHandling() {
        self.handler
            .bind(onNext: self.handle)
            .disposed(by: self.disposeBag)
    }
    
    //MARK: -
    //MARK: Overriding
    
    open func handle(events: EventsType) {
        
    }
}

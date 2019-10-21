//
//  ViewModel.swift
//  Navigation
//
//  Created by IDAP Developer on 9/5/19.
//  Copyright © 2019 Bendis. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

public enum ViewModelEvents {
    
    case didUpdated
}

open class ViewModel<ConfiguratorType: Configurator, EventsType: Events> {

    //MARK: -
    //MARK: Variables
    
    public var events: Observable<EventsType> {
        return self.eventsEmiter.asObservable()
    }
    public let eventsEmiter = PublishSubject<EventsType>()
    
    internal var internalEvents: Observable<ViewModelEvents> {
        return self.internalEventsEmiter.asObservable()
    }
    internal let internalEventsEmiter = PublishSubject<ViewModelEvents>()
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
        self.events
            .observeOn(MainScheduler.asyncInstance)
            .bind(onNext: self.handle)
            .disposed(by: self.disposeBag)
    }
    
    //MARK: -
    //MARK: Overriding
    
    func handle(events: EventsType) {
        
    }
}

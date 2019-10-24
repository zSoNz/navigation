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

open class ViewModel<ConfiguratorType: Configurator, OutputEventsType: Events, InputEventsType: Events> {

    //MARK: -
    //MARK: Variables
    
    public var events: Observable<OutputEventsType> {
        return self.internalEventsEmiter.asObservable()
    }
    
    public let eventEmiter = PublishSubject<InputEventsType>()
    
    internal let internalEventsEmiter = PublishSubject<OutputEventsType>()
    internal let configurator: ConfiguratorType
    internal var didUpdate: () -> () = {}
    
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
        
        self.eventEmiter
            .observeOn(MainScheduler.asyncInstance)
            .bind(onNext: self.handle)
            .disposed(by: self.disposeBag)
    }
    
    //MARK: -
    //MARK: Overriding
    
    func handle(events: OutputEventsType) {
        
    }
    
    func handle(events: InputEventsType) {
        
    }
}

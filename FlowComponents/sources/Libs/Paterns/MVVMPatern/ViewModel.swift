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

    typealias InputEvents = InputEventsType
    typealias OutputEvents = OutputEventsType
    
    //MARK: -
    //MARK: Variables
    
    public var events: Observable<OutputEventsType> {
        return self.outputEventsEmiter.asObservable()
    }
    
    public let eventEmiter = PublishRelay<InputEventsType>()
    
    internal let outputEventsEmiter = PublishRelay<OutputEventsType>()
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
        self.eventEmiter
            .observeOn(MainScheduler.asyncInstance)
            .bind(onNext: self.handle)
            .disposed(by: self.disposeBag)
    }
    
    //MARK: -
    //MARK: Overriding

    func handle(events: InputEventsType) {
        
    }
}

//
//  ViewModel.swift
//  Navigation
//
//  Created by IDAP Developer on 9/5/19.
//  Copyright © 2019 Bendis. All rights reserved.
//

import UIKit

import Models

import RxSwift
import RxCocoa

open class ViewModel<ModelType: Model, EventsType: Events>: PropertyContainer {

    //MARK: -
    //MARK: Variables
    
    public let handler = PublishSubject<EventsType>()
    
    public var model: Observable<ModelType> {
        return self.modelEmiter.asObservable()
    }
    
    internal let modelEmiter: BehaviorRelay<ModelType>
    
    private let disposeBag = DisposeBag()
    
    //MARK: -
    //MARK: Initializations
    
    public init(with model: ModelType) {
        self.modelEmiter = BehaviorRelay(value: model)
        
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

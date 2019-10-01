//
//  View.swift
//  Navigation
//
//  Created by IDAP Developer on 9/5/19.
//  Copyright © 2019 Bendis. All rights reserved.
//

import UIKit

import Models

import RxSwift

open class MVVMView<ModelType, EventsType>: UIViewController
    where EventsType: Events, ModelType: Model
{

    //MARK: -
    //MARK: Type Inferences
    
    public typealias ViewModelType = ViewModel<ModelType, EventsType>
    
    //MARK: -
    //MARK: Accesors
    
    public var events: Observable<EventsType> {
        return self.eventsEmiter.asObserver()
    }
    
    let eventsEmiter = PublishSubject<EventsType>()
    
    private let viewModel: ViewModelType
    private let disposeBag = DisposeBag()
    
    //MARK: -
    //MARK: Initializations
    
    public init(viewModel: ViewModelType) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        
        self.prepareViewModelHandling()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -
    //MARK: View Life-Cylce
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        self.fill(with: self.viewModel.modelEmiter.value)
        self.prepareBindings(disposeBag: self.disposeBag)
    }
    
    //MARK: -
    //MARK: Private
    
    private func prepareViewModelHandling() {
        self.viewModel
            .modelEmiter
            .subscribe(onNext: self.fill)
            .disposed(by: self.disposeBag)
        
        self.eventsEmiter
            .bind(to: self.viewModel.handler)
            .disposed(by: self.disposeBag)
    }
    
    //MARK: -
    //MARK: Overrding methods
    
    open func fill(with model: ModelType) {
        
    }
    
    open func prepareBindings(disposeBag: DisposeBag) {
        
    }
}

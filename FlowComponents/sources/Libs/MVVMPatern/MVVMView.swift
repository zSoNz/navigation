//
//  View.swift
//  Navigation
//
//  Created by IDAP Developer on 9/5/19.
//  Copyright © 2019 Bendis. All rights reserved.
//

import UIKit

import RxSwift

open class MVVMView<ViewModelType, ConfiguratorType, ViewModelEventsType>: UIViewController
    where ViewModelType: ViewModel<ConfiguratorType, ViewModelEventsType>, ViewModelEventsType: Events, ConfiguratorType: Configurator
{

    //MARK: -
    //MARK: Accesors
    
    public var events: Observable<ViewModelEventsType> {
        return self.eventsEmiter.asObserver()
    }
    
    let eventsEmiter = PublishSubject<ViewModelEventsType>()
    
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
        
        self.fill(with: self.viewModel)
        self.prepareBindings(disposeBag: self.disposeBag)
    }
    
    //MARK: -
    //MARK: Private
    
    private func prepareViewModelHandling() {
        self.viewModel
            .eventsEmiter
            .compactMap { [weak self] _ in self?.viewModel }
            .subscribe(onNext: self.fill)
            .disposed(by: self.disposeBag)
        
        self.eventsEmiter
            .bind(to: self.viewModel.handler)
            .disposed(by: self.disposeBag)
    }
    
    //MARK: -
    //MARK: Overrding methods
    
    func fill(with viewModel: ViewModelType) {
        
    }
    
    func prepareBindings(disposeBag: DisposeBag) {
        
    }
}

//
//  View.swift
//  Navigation
//
//  Created by IDAP Developer on 9/5/19.
//  Copyright © 2019 Bendis. All rights reserved.
//

import UIKit

import RxSwift
import RxRelay

open class MVVMView<ViewModelType, ConfiguratorType, ViewModelOutputEventsType, ViewModelInputEventsType>: UIViewController
    where ViewModelType: ViewModel<ConfiguratorType, ViewModelOutputEventsType, ViewModelInputEventsType>, ViewModelOutputEventsType: Events, ConfiguratorType: Configurator, ViewModelInputEventsType: Events
{
    
    //MARK: -
    //MARK: Accesors
    
    public var events: Observable<ViewModelOutputEventsType> {
        return self.viewModel.events
    }
    
    public var eventsEmiter: PublishRelay<ViewModelInputEventsType> {
        return self.viewModel.eventEmiter
    }
    
    internal let viewModel: ViewModelType
    private let disposeBag = DisposeBag()
    
    //MARK: -
    //MARK: Initializations
    
    public init(viewModel: ViewModelType, bundle: Bundle? = nil) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: bundle)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -
    //MARK: View Life-Cylce
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        self.prepareBindings(disposeBag: self.disposeBag)
        self.prepareLocalization()
    }
    
    //MARK: -
    //MARK: Overrding methods
    
    func prepareBindings(disposeBag: DisposeBag) {
        
    }
    
    func prepareLocalization() {
        
    }
}

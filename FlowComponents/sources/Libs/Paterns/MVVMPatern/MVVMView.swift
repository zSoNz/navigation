//
//  View.swift
//  Navigation
//
//  Created by IDAP Developer on 9/5/19.
//  Copyright © 2019 Bendis. All rights reserved.
//

import UIKit

import RxSwift

open class MVVMView<ViewModelType, ConfiguratorType>: UIViewController
    where ViewModelType: ViewModel<ConfiguratorType>, ConfiguratorType: Configurator
{
    
    public let viewModel: ViewModelType
    
    //MARK: -
    //MARK: Initializations
    
    public init(viewModel: ViewModelType) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configViewModel()
    }
    
    open func configViewModel() {
        
    }
}

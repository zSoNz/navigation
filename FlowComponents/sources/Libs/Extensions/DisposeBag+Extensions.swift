//
//  DisposeBag+Extensions.swift
//  FlowComponents
//
//  Created by Dmytryi Mosin on 17.03.2020.
//  Copyright © 2020 Bendis. All rights reserved.
//

import RxSwift

public extension DisposeBag {
    
    func insert(_ values: [Disposable?]) {
        let result = values.compactMap { $0 }
        self.insert(result)
    }
    
    func insert(_ values: Disposable?...) {
        self.insert(values)
    }
}

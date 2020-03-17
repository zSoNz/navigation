//
//  UIBindings+ControlEvent.swift
//  FlowComponents
//
//  Created by Dmytryi Mosin on 17.03.2020.
//  Copyright © 2020 Bendis. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

public func ~> <Value>(source: ControlEvent<Value>?, binder: PublishRelay<Value>?) -> Disposable? {
    return binder.flatMap { source?.bind(to: $0) }
}

public func ~> <Value>(source: ControlEvent<Value>?, binder: BehaviorRelay<Value>?) -> Disposable? {
    return binder.flatMap { source?.bind(to: $0) }
}

//MARK: -
//MARK: UIButton

public func ~> (source: UIButton?, binder: PublishRelay<Void>?) -> Disposable? {
    return source?.rx.tap ~> binder
}

public func ~> (source: UIButton?, binder: BehaviorRelay<Void>?) -> Disposable? {
    return source?.rx.tap ~> binder
}

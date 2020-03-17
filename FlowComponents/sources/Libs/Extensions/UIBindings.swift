//
//  UIBindings.swift
//  Navigation
//
//  Created by Dmytryi Mosin on 17.03.2020.
//  Copyright © 2020 Bendis. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

infix operator ~>: AdditionPrecedence

public func ~> <Value>(source: Observable<Value>, binder: Binder<Value>?) -> Disposable? {
    return binder.map { source.bind(to: $0) }
}

public func ~> <Value>(source: Observable<Value>, binder: Binder<Value?>?) -> Disposable? {
    return binder.map { source.bind(to: $0) }
}

//MARK: -
//MARK: UILabel

public func ~> (source: Observable<String?>, control: UILabel?) -> Disposable? {
    return source ~> control?.rx.text
}

public func ~> (source: Observable<String>, control: UILabel?) -> Disposable? {
    return source ~> control?.rx.text
}

//MARK: -
//MARK: UIImageView

public func ~> (source: Observable<UIImage?>, control: UIImageView?) -> Disposable? {
    return source ~> control?.rx.image
}

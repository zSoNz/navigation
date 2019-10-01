//
//  FlowViewControllerOutEvent.swift
//  Ketogenic
//
//  Created by Artem Chabannyi on 2/18/19.
//  Copyright © 2019 IDAP Group. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

public protocol FlowViewControllerOutEvent {
    
    associatedtype EventAction
    typealias EventEmitter = Observable<EventAction>
    
    var event: EventEmitter { get }
}

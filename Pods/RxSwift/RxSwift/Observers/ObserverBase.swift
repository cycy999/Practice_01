//
//  ObserverBase.swift
//  RxSwift
//
//  Created by Krunoslav Zaher on 2/15/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

class ObserverBase<ElementType> : Disposable, ObserverType {
    typealias E = ElementType

    private var _isStopped = AtomicInt(0)

    func on(_ event: Event<E>) {
        switch event {
        case .next:
            if load(&self._isStopped) == 0 {
                self.onCore(event)
            }
        case .error, .completed:
            if fetchOr(&self._isStopped, 1) == 0 {
                self.onCore(event)
            }
        }
    }

    func onCore(_ event: Event<E>) {
        rxAbstractMethod()
    }

    func dispose() {
        fetchOr(&self._isStopped, 1)
    }
}

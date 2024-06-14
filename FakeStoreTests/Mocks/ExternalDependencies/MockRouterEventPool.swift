//
//  MockRouterEventPool.swift
//  FakeStoreTests
//
//  Created by Andres Duque on 13/06/24.
//

import Combine
@testable import FakeStoreCommons

final class MockRouterEventPool: RouterEventPool {
    var publisher: AnyPublisher<RouterEvent, Never> {
        PassthroughSubject<RouterEvent, Never>().eraseToAnyPublisher()
    }
    
    var emitedEvent: RouterEvent?
    var emitWasCalled: Bool = false
    
    func emit(_ event: RouterEvent) {
        emitedEvent = event
        emitWasCalled = true
    }
}

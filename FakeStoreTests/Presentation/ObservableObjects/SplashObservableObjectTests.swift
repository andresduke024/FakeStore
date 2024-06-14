//
//  SplashObservableObjectTests.swift
//  FakeStoreTests
//
//  Created by Andres Duque on 13/06/24.
//

import XCTest
@testable import FakeStore
@testable import FakeStoreCommons
@testable import SwiftDependencyInjector

final class SplashObservableObjectTests: XCTestCase {

    private var sut: SplashObservableObject!
    
    private var mockRouterEventPool: MockRouterEventPool!
    private var mockGetAuthenticationStateUseCase: MockGetAuthenticationStateUseCase!
    
    private let injector = Injector.build(context: .tests(name: "SplashObservableObject"))
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        mockRouterEventPool = MockRouterEventPool()
        mockGetAuthenticationStateUseCase = MockGetAuthenticationStateUseCase()
        
        injector.register(RouterEventPool.self) { self.mockRouterEventPool }
        injector.register(GetAuthenticationStateUseCaseProtocol.self) { self.mockGetAuthenticationStateUseCase }
        
        sut = SplashObservableObject()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        mockRouterEventPool = nil
        mockGetAuthenticationStateUseCase = nil
        sut = nil
        injector.destroy()
    }
    
    func testEmitRouterEventForAuthenticatedUser() async {
        mockGetAuthenticationStateUseCase.result = .authenticated
        
        await sut.start()
        
        XCTAssertEqual(mockRouterEventPool.emitedEvent, .newNavDestination(.home))
    }
    
    func testEmitRouterEventForUnauthenticatedUser() async {
        mockGetAuthenticationStateUseCase.result = .unauthenticated
        
        await sut.start()
        
        XCTAssertEqual(mockRouterEventPool.emitedEvent, .newNavDestination(.authentication))
    }
}

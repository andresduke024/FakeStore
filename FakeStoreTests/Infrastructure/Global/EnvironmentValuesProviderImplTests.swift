//
//  EnvironmentValuesProviderImplTests.swift
//  FakeStoreTests
//
//  Created by Andres Duque on 12/06/24.
//

import XCTest
@testable import FakeStore
@testable import FakeStoreCommons
@testable import SwiftDependencyInjector

final class EnvironmentValuesProviderImplTests: XCTestCase {

    private var sut: EnvironmentValuesProviderImpl!
    
    private var mockGlobalSettingsProvider: MockGlobalSettingsProvider!
    
    private let injector = Injector.build(context: .tests(name: "EnvironmentValuesProviderImpl"))
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        mockGlobalSettingsProvider = MockGlobalSettingsProvider()
        
        injector.register(GlobalSettingsProviderProtocol.self) { self.mockGlobalSettingsProvider }
        
        sut = EnvironmentValuesProviderImpl()
    }

    override func tearDownWithError() throws {
        try super.setUpWithError()
        
        mockGlobalSettingsProvider = nil
        sut = nil
        injector.destroy()
    }
    
    func testGetSuccess() {
        mockGlobalSettingsProvider.dataResult = [
            EnvironmentValuesKeys.serviceURL.rawValue: "service_mock_url"
        ]
        
        let value: String? = sut.get(.serviceURL)
        
        XCTAssertNotNil(value)
    }
    
    func testGetFailure() {
        mockGlobalSettingsProvider.dataResult = [:]
        
        let value: String? = sut.get(.serviceURL)
        
        XCTAssertNil(value)
    }
}

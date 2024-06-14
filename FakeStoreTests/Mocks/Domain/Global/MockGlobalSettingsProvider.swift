//
//  MockGlobalSettingsProvider.swift
//  FakeStoreTests
//
//  Created by Andres Duque on 12/06/24.
//

@testable import FakeStore

final class MockGlobalSettingsProvider: GlobalSettingsProviderProtocol {
    var dataResult: [String: Any] = [:]
    
    var data: [String: Any] { dataResult }
}

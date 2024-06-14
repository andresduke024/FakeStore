//
//  EnvironmentValuesProviderImpl.swift
//  FakeStore
//
//  Created by Andres Duque on 30/05/24.
//

import Foundation
import FakeStoreCommons
import SwiftDependencyInjector

struct EnvironmentValuesProviderImpl: EnvironmentValuesProviderProtocol {
    
    @Injectable
    private var globalSettings: GlobalSettingsProviderProtocol?
    
    init() {}
    
    func get<T>(_ key: EnvironmentValuesKeys) -> T? {
        guard let data = globalSettings?.data[key.rawValue], let value = data as? T else {
            return nil
        }
        
        return value
    }
}

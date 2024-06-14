//
//  AppBuilder.swift
//  FakeStore
//
//  Created by Andres Duque on 29/05/24.
//

import Foundation
import FakeStoreCommons
import FakeStoreAuthentication
import SwiftDependencyInjector

struct AppBuilder: BasePackageBuilderProtocol {
    public func start() {
        let injector = Injector.global
        injector.turnOffLogger(forced: true)
        
        // Base
        injector.register(GlobalSettingsProviderProtocol.self, implementation: GlobalSettingsProviderImpl.instance)
        injector.register(EnvironmentValuesProviderProtocol.self, implementation: EnvironmentValuesProviderImpl.instance)
        
        injector.register(Theme.self, implementation: AppTheme.instance)
        
        // Packages
        let builders: [BasePackageBuilderProtocol] = [
            CommonsPackageBuilder(),
            AuthenticationPackageBuilder(),
        ]
        
        for builder in builders {
            builder.start()
        }
    }
}

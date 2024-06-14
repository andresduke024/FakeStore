//
//  GlobalSettingsProviderProtocol.swift
//  FakeStore
//
//  Created by Andres Duque on 30/05/24.
//

import Foundation
import SwiftDependencyInjector

protocol GlobalSettingsProviderProtocol: InjectableDependency {
    var data: [String: Any] { get }
}

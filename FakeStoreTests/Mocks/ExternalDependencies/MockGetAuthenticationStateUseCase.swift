//
//  MockGetAuthenticationStateUseCase.swift
//  FakeStoreTests
//
//  Created by Andres Duque on 13/06/24.
//

import Foundation
@testable import FakeStore
@testable import FakeStoreCommons

final class MockGetAuthenticationStateUseCase: GetAuthenticationStateUseCaseProtocol {
    var result: AuthenticationState?
    
    func invoke() async -> AuthenticationState {
        result ?? .unauthenticated
    }
}

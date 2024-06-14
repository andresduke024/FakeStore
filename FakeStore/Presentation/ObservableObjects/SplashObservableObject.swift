//
//  SplashObservableObject.swift
//  FakeStore
//
//  Created by Andres Duque on 4/06/24.
//

import SwiftUI
import FakeStoreCommons
import SwiftDependencyInjector

final class SplashObservableObject: ObservableObject {
    
    @Inject(injection: .singleton)
    private var routerEventPool: RouterEventPool
    
    @Inject
    private var getAuthenticationStateUseCase: GetAuthenticationStateUseCaseProtocol
    
    func start() async {
        try? await Task.sleep(for: .seconds(1))
        
        let authenticationState = await getAuthenticationStateUseCase.invoke()
        
        let newDestination: NavDestinations = switch authenticationState {
            case .authenticated:
                .home
            case .unauthenticated:
                .authentication
        }
        
        let event: RouterEvent = .newNavDestination(newDestination)
        await routerEventPool.emit(event)
    }
}

//
//  FakeStoreApp.swift
//  FakeStore
//
//  Created by Andres Duque on 29/05/24.
//

import SwiftUI
import FakeStoreCommons
import FakeStoreAuthentication

@main
struct FakeStoreApp: App {
    
    @StateObject
    private var router = Router()
    
    @StateObject
    private var tabRouter = TabRouter()
    
    init() {
        AppBuilder().start()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath) {
                SplashView()
                    .navigationDestination(for: NavDestinations.self, destination: makeNavDestinations)
                    .navigationBarHidden(true)
            }
            .environmentObject(router)
            .environmentObject(tabRouter)
        }
    }
    
    @ViewBuilder
    private func makeNavDestinations(_ destination: NavDestinations) -> some View {
        switch destination {
        case .home:
            HomeView()
        case .authentication:
            AuthenticationModuleView()
        }
    }
}

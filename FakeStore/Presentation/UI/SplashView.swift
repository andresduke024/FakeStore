//
//  SplashView.swift
//  FakeStore
//
//  Created by Andres Duque on 30/05/24.
//

import SwiftUI
import FakeStoreCommons
import SwiftDependencyInjector

struct SplashView: View {
    
    @Injectable
    private var theme: Theme?
    
    @Injectable(injection: .singleton)
    private var routerEventPool: RouterEventPool?
    
    @StateObject
    private var observableObject = SplashObservableObject()
    
    var body: some View {
        BaseNavigationView(routerEventPool: routerEventPool) {
            PrimaryBackground {
                Image("Splash")
            }
        }
        .onAppear {
            Task { await observableObject.start() }
        }
    }
}

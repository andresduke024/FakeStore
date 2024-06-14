//
//  HomeView.swift
//  FakeStore
//
//  Created by Andres Duque on 7/06/24.
//

import SwiftUI
import FakeStoreCommons
import SwiftDependencyInjector

struct HomeView: View {
    
    @Injectable
    private var logOutUseCase: LogOutUseCaseProtocol?
    
    @EnvironmentObject
    private var router: Router
    
    var body: some View {
        BaseTabView {
            TabItem(type: .lobby) {
                Text("Lobby")
            }
            
            TabItem(type: .cart) {
                Text("Cart")
            }
            
            TabItem(type: .profile) {
                buildProfile()
            }
        }
    }
    
    @ViewBuilder
    private func buildProfile() -> some View {
        VStack(alignment: .center, spacing: 10) {
            Text("Profile")
            
            Button {
                Task {
                    await logOutUseCase?.invoke()
                    router.replace(newDestination: .home)
                }
            } label: {
                Text("Log out")
            }

        }
    }
}

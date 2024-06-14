//
//  AppTheme.swift
//  FakeStore
//
//  Created by Andres Duque on 29/05/24.
//

import SwiftUI
import FakeStoreCommons

struct AppTheme: Theme {
    var primaryColor: Color? {
        Color("ThemePrimaryColor")
    }
    
    var secondaryColor: Color? {
        Color("ThemeSecondaryColor")
    }
    
    var onPrimaryColor: Color? {
        Color("ThemeOnPrimaryColor")
    }
    
    var onSecondaryColor: Color? {
        Color("ThemeOnSecondaryColor")
    }
    
    var backgroundColor: Color? {
        Color("ThemeBackgroundColor")
    }
    
    var onBackgroundColor: Color? {
        Color("ThemeOnBackgroundColor")
    }
}

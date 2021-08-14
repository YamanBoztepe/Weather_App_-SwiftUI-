//
//  NavigationBar.swift
//  Weather App (SwiftUI)
//
//  Created by Yaman Boztepe on 14.08.2021.
//

import SwiftUI

struct NavigationBar: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                UINavigationBar.appearance().barTintColor = .black
                UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor.white]
                StatusBar.current.setWhiteColor()
            }
    }
}

extension View {
    func setDarkNavigationBar() -> some View {
        self.modifier(NavigationBar())
    }
}

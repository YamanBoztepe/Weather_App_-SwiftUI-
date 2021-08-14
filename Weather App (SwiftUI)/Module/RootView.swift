//
//  RootView.swift
//  Weather App (SwiftUI)
//
//  Created by Yaman Boztepe on 5.08.2021.
//

import SwiftUI

struct RootView: View {
    @State private var startApp = false
    
    var body: some View {
        ZStack {
            if startApp {
                MainView()
                
            } else {
                SplashView(isAnimateEnded: $startApp)
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}

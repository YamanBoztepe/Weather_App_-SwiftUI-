//
//  SplashView.swift
//  Weather App (SwiftUI)
//
//  Created by Yaman Boztepe on 10.08.2021.
//

import SwiftUI

struct SplashView: View {
    @State private var animate = false
    @Binding var isAnimateEnded: Bool
    
    var body: some View {
        splashBody
    }
    
    var splashBody: some View {
        ZStack {
            Color("splashBackground")
            Image("appcentLogo")
                .aspectRatio(contentMode: .fit)
                .scaleEffect(animate ? 15 : 1)
        }
        .ignoresSafeArea()
        .onAppear(perform: animateLogo)
    }
    
    private func animateLogo() {
        withAnimation(.easeOut(duration: 1)) {
            animate.toggle()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            isAnimateEnded = true
        }
    }
}


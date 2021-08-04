//
//  SplashView.swift
//  Weather App (SwiftUI)
//
//  Created by Yaman Boztepe on 5.08.2021.
//

import SwiftUI

struct SplashView: View {
    @State private var animate = false
    @State private var isAnimateCompleted = false
    
    var body: some View {
        ZStack {
            MainView()
            
            ZStack {
                Color("splashBackground")
                Image("appcentLogo")
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(animate ? 15 : 1)
            }
            .ignoresSafeArea()
            .onAppear(perform: animateLogo)
            .opacity(isAnimateCompleted ? 0 : 1)
        }
    }
    
    private func animateLogo() {
        withAnimation(.easeOut(duration: 1)) {
            animate.toggle()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimateCompleted = true
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}

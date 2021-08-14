//
//  Extensions+HostingController.swift
//  Weather App (SwiftUI)
//
//  Created by Yaman Boztepe on 14.08.2021.
//

import SwiftUI

class HostingController: UIHostingController<RootView> {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        switch StatusBar.current.color {
        case .light:
            return .lightContent
            
        case .dark:
            return .darkContent
        }
    }
}

extension UIApplication {
    func switchHostingController() {
        windows.first?.rootViewController = HostingController(rootView: RootView())
    }
}

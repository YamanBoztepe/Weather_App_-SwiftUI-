//
//  StatusBar.swift
//  Weather App (SwiftUI)
//
//  Created by Yaman Boztepe on 14.08.2021.
//

import Foundation

class StatusBar {
    static let current = StatusBar()
    private(set) var color: StatusBarColor = .dark
    
    private init() { }
    
    func setDarkColor() {
        color = .dark
    }
    
    func setWhiteColor() {
        color = .light
    }
    
    enum StatusBarColor {
        case light
        case dark
    }
    
}

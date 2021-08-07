//
//  WeatherViewModel.swift
//  Weather App (SwiftUI)
//
//  Created by Yaman Boztepe on 8.08.2021.
//

import Foundation

struct WeatherViewModel {
    let temperature, description, icon, main: String
    let windSpeed: Float
    let humidity: Int
    
    init(_ model: WeatherModel) {
        temperature = model.temp
        description = model.desc
        icon = model.icon
        main = model.main
        windSpeed = model.windSpeed
        humidity = model.humidity
    }
}

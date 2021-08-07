//
//  WeatherModel.swift
//  Weather App (SwiftUI)
//
//  Created by Yaman Boztepe on 7.08.2021.
//

import Foundation

struct WeatherModel {
    var temp: String = "-"
    var desc: String = "-"
    var place: String = "-"
    var icon: String = "-"
    var main: String = "-"
    var windSpeed: Float = 0
    var humidity: Int = 0
    
    init(model: OpenWeatherApiModel) {
        guard let desc = model.weather?.first?.description,
              let place = model.name,
              let main = model.weather?.first?.main,
              let temp = model.main?.temp,
              let humidity = model.main?.humidity,
              let windSpeed = model.wind?.speed else { return }
        
        self.temp = "\(Int(temp - 273.15))" // Convert from fahrenheit to celsius
        self.desc = desc
        self.place = place
        self.icon = setIcon(for: main)
        self.main = main
        self.windSpeed = windSpeed * 3.6 // Convert from m/s to km/h
        self.humidity = Int(humidity)
    }
    
    init() { }
    
    private func setIcon(for weather: String) -> String {
        switch weather {
        case "Clear":
            return "sun"
        case "Rain":
            return "rain"
        default:
            return "cloudy"
        }
    }
}

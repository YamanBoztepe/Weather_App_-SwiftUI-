//
//  OpenWeatherApiModel.swift
//  Weather App (SwiftUI)
//
//  Created by Yaman Boztepe on 31.07.2021.
//

import Foundation

struct OpenWeatherApiModel: Decodable {
    let weather: [Weather]?
    let main: Main?
    let name: String?
}

struct Weather: Decodable {
    let main: String?
    let description: String?
}

struct Main: Decodable {
    let temp: Float?
}

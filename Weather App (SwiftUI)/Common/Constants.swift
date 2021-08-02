//
//  Constants.swift
//  Weather App (SwiftUI)
//
//  Created by Yaman Boztepe on 31.07.2021.
//

import Foundation

struct ApiConstants {
    static let baseUrl = "https://api.openweathermap.org/data/2.5/weather"
    static let latitude = "lat="
    static let longitude = "lon="
    static let apiKey = "appid=7129afc01ab0c5c5aeedc75daaa66abc"
    
    static func getBaseUrl(with components: String) -> String {
        ApiConstants.baseUrl + "?" + components + "&" + ApiConstants.apiKey
    }
}

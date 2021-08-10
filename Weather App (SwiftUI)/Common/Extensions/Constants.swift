//
//  Constants.swift
//  Weather App (SwiftUI)
//
//  Created by Yaman Boztepe on 31.07.2021.
//

import SwiftUI

struct ApiConstants {
    static let baseUrl = "https://api.openweathermap.org/data/2.5/weather"
    static let latitude = "lat="
    static let longitude = "lon="
    static let apiKey = "appid=7129afc01ab0c5c5aeedc75daaa66abc"
    
    static func getBaseUrl(with components: String) -> String {
        ApiConstants.baseUrl + "?" + components + "&" + ApiConstants.apiKey
    }
}

struct CustomColor {
    static let yellow = Color.init(red: 246/255, green: 222/255, blue: 138/255)
    static let darkYellow = Color.init(red: 245/255, green: 195/255, blue: 154/255)
    
    static let blueOne = Color.init(red: 148/255, green: 246/255, blue: 229/255)
    static let blueTwo = Color.init(red: 124/255, green: 210/255, blue: 247/255)
    static let darkBlue = Color.init(red: 48/255, green: 46/255, blue: 96/255)
    
    static let darkGray = Color.init(red: 35/255, green: 37/255, blue: 53/255)
}

//
//  WeatherView.swift
//  Weather App (SwiftUI)
//
//  Created by Yaman Boztepe on 31.07.2021.
//

import SwiftUI

struct WeatherView: View {
    let temperature: String
    let description: String
    let icon: String
    
    var body: some View {
        VStack(spacing: 20) {
            iconBody
            weatherTextBody
        }
    }
    
    var iconBody: some View {
        Image(systemName: icon)
            .font(.largeTitle)
    }
    
    var weatherTextBody: some View {
        VStack(spacing: 5) {
            Text(description)
                .font(.subheadline)
                .foregroundColor(.gray)
            Text("\(temperature)°C")
                .font(.largeTitle)
        }
        
    }
}








/*
struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
*/

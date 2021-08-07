//
//  WeatherView.swift
//  Weather App (SwiftUI)
//
//  Created by Yaman Boztepe on 31.07.2021.
//

import SwiftUI

struct WeatherView: View {
    let model: WeatherViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            iconBody
            weatherTextBody
        }
    }
    
    var iconBody: some View {
        Image(model.icon)
            .resizable()
            .frame(width: 200, height: 200)
            .foregroundColor(setIconColor(for: model.main))
            .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.5), radius: 20)
    }
    
    var weatherTextBody: some View {
        VStack(spacing: 5) {
            Text(model.description)
                .font(.subheadline)
                .fontWeight(.semibold)
            
            Text("\(model.temperature) °")
                .font(.system(size: 70))
                .fontWeight(.semibold)
            
            HStack(spacing: 15) {
                windView
                humidityView
            }
            .font(.system(size: 10))
        }
        .foregroundColor(CustomColor.darkBlue)
        
    }
    
    var windView: some View {
        HStack(spacing: 10) {
            Image(systemName: "wind")
            Text("\(model.windSpeed, specifier: "%.2f") km/h")
        }
    }
    
    var humidityView: some View {
        HStack(spacing: 10) {
            Image(systemName: "drop")
            Text("\(model.humidity) %")
        }
    }
    
    private func setIconColor(for weather: String) -> Color {
        switch weather {
        case "Clear":
            return Color.yellow
        case "Rain":
            return Color.blue
        default:
            return Color.blue
        }
    }
}

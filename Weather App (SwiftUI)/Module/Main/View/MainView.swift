//
//  MainView.swift
//  Weather App (SwiftUI)
//
//  Created by Yaman Boztepe on 31.07.2021.
//

import SwiftUI

struct MainView: View {
    @ObservedObject private var viewModel = MainViewModel()
    
    var body: some View {
        VStack {
            VStack(spacing: 30) {
                header
                weatherBody
            }
            Spacer()
        }
        .background(setBackgroundColor(for: viewModel.weatherModel.main)
                        .ignoresSafeArea())
    }
    
    var header: some View {
        MainHeaderView(place: viewModel.weatherModel.place)
    }
    
    var weatherBody: some View {
        WeatherView(model: .init(viewModel.weatherModel))
    }
    
    @ViewBuilder
    private func setBackgroundColor(for weather: String) -> some View {
        switch weather {
        case "Clear":
            LinearGradient(gradient: Gradient(colors: [CustomColor.yellow, CustomColor.darkYellow]), startPoint: .top, endPoint: .bottom)
            
        case "Rain":
            CustomColor.blueOne
            
        default:
            CustomColor.blueTwo
        }
    }
}













struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

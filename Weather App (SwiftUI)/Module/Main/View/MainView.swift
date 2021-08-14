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
        NavigationView {
            VStack {
                VStack(spacing: 30) {
                    header
                    weatherBody
                }
                Spacer()
                dailyWeatherBody
            }
            .background(setBackgroundColor(for: viewModel.weatherModel.main)
                            .ignoresSafeArea())
            .navigationBarHidden(true)
            .onAppear {
                StatusBar.current.setDarkColor()
            }
        }
    }
    
    var header: some View {
        MainHeaderView(place: viewModel.weatherModel.place)
    }
    
    var weatherBody: some View {
        WeatherView(model: .init(viewModel.weatherModel))
    }
    
    var dailyWeatherBody: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(0..<5) { _ in
                    DailyWeatherView()
                        .frame(width: 120, height: 230)
                }
            }
            .padding(.horizontal, 20)
        }
        .padding(.bottom, 20)
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

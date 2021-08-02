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
                weatherBody
                Spacer()
            }
            .padding(20)
            .navigationBarTitle(viewModel.place, displayMode: .inline)
        }
    }
    
    var weatherBody: some View {
        WeatherView(temperature: viewModel.temp,
                    description: viewModel.desc,
                    icon: viewModel.icon)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

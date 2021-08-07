//
//  MainViewModel.swift
//  Weather App (SwiftUI)
//
//  Created by Yaman Boztepe on 31.07.2021.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published private(set) var weatherModel = WeatherModel()
    
    private let locationManager = LocationManager()
    
    init() {
        updateWeather()
        locationManager.requestLocation()
    }
    
    // MARK: - Fetching Weather
    private func updateWeather() {
        locationManager.locationUpdated = { [weak self] location in
            guard let self = self else { return }
            
            self.fetchWeather(in: Coordinates(latitude: "\(location?.latitude ?? 0)", longitude: "\(location?.longitude ?? 0)"))
        }
    }
    
    private func fetchWeather(in coordinates: Coordinates) {
        let url = ApiConstants.getBaseUrl(with: ApiConstants.latitude + coordinates.latitude
                                            + "&" +
                                            ApiConstants.longitude + coordinates.longitude)
        
        NetworkManager.shared.getData(from: url,
                                      responseModel: OpenWeatherApiModel.self)
        { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self.weatherModel = .init(model: response)
                    
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}

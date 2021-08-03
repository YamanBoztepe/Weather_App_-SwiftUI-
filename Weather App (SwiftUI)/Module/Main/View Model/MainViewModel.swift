//
//  MainViewModel.swift
//  Weather App (SwiftUI)
//
//  Created by Yaman Boztepe on 31.07.2021.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var temp = "-"
    @Published var desc = "-"
    @Published var place = "-"
    @Published var icon = ""
    
    private let locationManager = LocationManager()
    
    init() {
        getLocation()
    }
    
    // MARK: - Fetching Weather
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
                    guard let desc = response.weather?.first?.description,
                          let place = response.name,
                          let icon = response.weather?.first?.main,
                          let temp = response.main?.temp else { return }
                    
                    self.desc = desc
                    self.place = place
                    self.icon = self.setIcon(for: icon)
                    self.temp = "\(Int(temp - 273.15))" // convert from fahrenheit to celsius
                    
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    // MARK: - Layout Actions
    private func setIcon(for weather: String) -> String {
        switch weather {
        case "Clear":
            return "sun.min"
        default:
            return "moon"
        }
    }
    
    // MARK:- Location Actions
    private func getLocation() {
        locationManager.requestLocation()
        locationManager.locationUpdated = { [weak self] location in
            guard let self = self else { return }
            
            self.fetchWeather(in: Coordinates(latitude: "\(location?.latitude ?? 0)", longitude: "\(location?.longitude ?? 0)"))
        }
    }
}

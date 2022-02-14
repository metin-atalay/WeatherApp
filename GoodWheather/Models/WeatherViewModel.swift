//
//  WeatherViewModel.swift
//  GoodWheather
//
//  Created by Metin Atalay on 13.02.2022.
//

import Foundation

class WeatherListViewModel {
    
    private var weatherViewModels = [WeatherViewModel] ()
    
    func addWeatherViewModel(_ vm: WeatherViewModel) {
        weatherViewModels.append(vm)
    }
    
    func numberOfRows()  -> Int {
        return weatherViewModels.count
    }
    
    func modalAt( _ index: Int) -> WeatherViewModel{
        return weatherViewModels[index]
    }
    
    private func toCelsius() {
        
        weatherViewModels = weatherViewModels.map { vm in
            let weatherModel = vm
            weatherModel.temperature = (weatherModel.temperature - 32) * 5/9
            return weatherModel
        }
        
    }
    
    private func toFahrenheit() {
        
        weatherViewModels = weatherViewModels.map { vm in
            let weatherModel = vm
            weatherModel.temperature = (weatherModel.temperature * 9/5) + 32
            return weatherModel
        }
    }
    
    func updateUnit(to unit: Unit) {
        switch unit {
            case .celsius:
                toCelsius()
            case .fahrenheit:
                toFahrenheit()
        }
    }
    
}

class WeatherViewModel {
    
    let weather: WeatherResponse
    var temperature: Double
    
    init(weather: WeatherResponse) {
        self.weather = weather
        temperature = weather.main.temp
    }
    
    var city: String {
        return weather.name
    }
  
}

//
//  Constants.swift
//  GoodWheather
//
//  Created by Metin Atalay on 13.02.2022.
//

import Foundation

struct Constants {
    
    struct Urls {
        
        static func urlForWeatherByCity(city: String) -> URL {
            
            // get the default settings for temperature
           let userDefaults = UserDefaults.standard
            let unit = (userDefaults.value(forKey: "unit") as? String) ?? "imperial"
            
            var weatherUrl = URL(string:"https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&appid=c963b70b14b723ca61e2e87089359287&units=\(unit)")!
            
            return weatherUrl
        }
        
    }
    
}

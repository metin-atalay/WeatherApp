//
//  WheatherResponse.swift
//  GoodWheather
//
//  Created by Metin Atalay on 13.02.2022.
//

import Foundation



struct WeatherResponse: Decodable {
    let name: String 
    let main : Weather
}

struct Weather: Decodable {
    let temp: Double
    let humidity: Double
}

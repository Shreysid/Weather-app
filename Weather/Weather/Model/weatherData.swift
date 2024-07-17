//
//  WeatherData.swift
//  Weather
//
//  Created by Shrey Sid on 28/06/24.
//

import Foundation

struct WeatherResponse: Codable {
    let main: Main
    let weather: [Weather]
    let name: String
    let dt: Date
    let sys: system
    let timezone: Int 
}

struct Main: Codable {
    let temp: Double
    let humidity: Int
}

struct Weather: Codable {
    let description: String
}

struct system: Codable{
    let sunrise: Int
    let sunset: Int
}

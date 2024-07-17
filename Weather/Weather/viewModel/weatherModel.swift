//
//  weatherModel.swift
//  Weather
//
//  Created by Shrey Sid on 29/06/24.
//

import Foundation
import UIKit

class WeatherModel: ObservableObject {
    @Published var temperature: Double = 0.0
    @Published var cityName: String = "Enter city"
    @Published var desc: String = "No description"
    @Published var hum: Int = 0
    @Published var sunrise: Date = Date()
    @Published var sunset: Date = Date()
    @Published var timeZone: TimeZone = TimeZone.current
    
    func fetchWeatherData(for city: String, completion: @escaping () -> Void) {
        let apiKey = "YOUR_API_KEY"
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&APPID=\(apiKey)&units=metric"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            completion()
            return
        }
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching weather data: \(error)")
                DispatchQueue.main.async {
                    completion()
                }
                return
            }
            
            guard let data = data else {
                print("No data returned")
                DispatchQueue.main.async {
                    completion()
                }
                return
            }
            
            do {
                let cityDetails = try JSONDecoder().decode(WeatherResponse.self, from: data)
                DispatchQueue.main.async {
                    self.temperature = cityDetails.main.temp
                    self.cityName = cityDetails.name
                    self.desc = cityDetails.weather.first?.description ?? "No description"
                    self.hum = cityDetails.main.humidity
                    self.sunrise = Date(timeIntervalSince1970: TimeInterval(cityDetails.sys.sunrise))
                    self.sunset = Date(timeIntervalSince1970: TimeInterval(cityDetails.sys.sunset))
                    self.timeZone = TimeZone(secondsFromGMT: cityDetails.timezone) ?? TimeZone.current
                    completion()
                }
            } catch {
                print("Error decoding JSON: \(error)")
                DispatchQueue.main.async {
                    completion()
                }
            }
        }
        task.resume()
    }
}

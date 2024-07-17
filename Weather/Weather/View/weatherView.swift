//
//  weatherView.swift
//  Weather
//
//  Created by Shrey Sid on 27/06/24.
//

import SwiftUI

struct weatherView: View {
    @StateObject var weatherDetails = WeatherModel()
    @State private var cityName: String = ""
    @StateObject var networkMonitor = NetworkMonitor()
    @State private var showAlert: Bool = false
    @State private var isLoading: Bool = false
    
    var body: some View {
        ZStack(alignment: .top) {
            backgroundColor()
            
            if isLoading {
                VStack {
                    Spacer()
                    ProgressView("Fetching Weather Data...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .cornerRadius(10)
                    Spacer()
                }
            } else {
                ScrollView {
                    VStack {
                        searchBar(cityName: $cityName, onSubmit: {
                            fetchWeather()
                        })
                        
                        locationName(weatherDetails: weatherDetails)
                        dayTime(weatherDetails: weatherDetails)
                        weatherImage()
                        descTemp(weatherDetails: weatherDetails)
                        extraDetails(weatherDetails: weatherDetails)
                    }
                }
                .refreshable {
                    if !cityName.isEmpty {
                        fetchWeather()
                    }
                }
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("No Internet Connection"),
                message: Text("Please check your internet connection and try again."),
                dismissButton: .default(Text("OK"))
            )
        }
    }
    
    private func fetchWeather() {
        let trimmedCityName = cityName.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !trimmedCityName.isEmpty else {
            return
        }
        
        guard networkMonitor.isConnected else {
            print("No internet connection")
            showAlert = true
            return
        }
        
        isLoading = true // Set loading to true when starting to fetch data
        
        print("Fetching weather for city: \(trimmedCityName)")
        weatherDetails.fetchWeatherData(for: trimmedCityName) {
            isLoading = false // Set loading to false when data fetch completes
            cityName = "" // Clear the text field after initiating the fetch
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        weatherView()
    }
}

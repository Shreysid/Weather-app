//
//  extraDetails.swift
//  Weather
//
//  Created by Shrey Sid on 04/07/24.
//

import SwiftUI

struct extraDetails: View {
    @StateObject var weatherDetails = WeatherModel()
    var body: some View {
        HStack(alignment:.bottom,spacing:70){
            VStack{
                Image(systemName: "sunrise")
                    .font(.largeTitle)
                Text("Sunrise")
                Text(formatTime(weatherDetails.sunrise, timeZone: weatherDetails.timeZone))
            }
            
            VStack{
                Image(systemName: "humidity")
                    .font(.largeTitle)
                Text("Humidity")
                let hum = String(weatherDetails.hum)
                Text("\(hum)%")
            }
            //                    Spacer(minLength: 4)
            VStack{
                Image(systemName: "sunset")
                    .font(.largeTitle)
                Text("Sunset")
                Text(formatTime(weatherDetails.sunset, timeZone: weatherDetails.timeZone))
            }
            
        }
        .padding(.top,30)
    }
    private func formatTime(_ date: Date, timeZone: TimeZone) -> String {
        let formatter = DateFormatter()
                formatter.dateFormat = "HH:mm" // 24-hour format
                formatter.timeZone = timeZone
                formatter.locale = Locale(identifier: "en_US_POSIX") 
                return formatter.string(from: date)
    }
}


#Preview {
    extraDetails()
}

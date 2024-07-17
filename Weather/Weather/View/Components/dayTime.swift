//
//  dayTime.swift
//  Weather
//
//  Created by Shrey Sid on 04/07/24.
//

import SwiftUI

struct dayTime: View {
    @ObservedObject var weatherDetails: WeatherModel
   
    var body: some View {
        HStack{
            Text(dayOfWeek)
            Text(timeOfDay)
        }
    }
    private var dayOfWeek: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        formatter.timeZone = weatherDetails.timeZone
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.string(from: Date())
    }
    
    private var timeOfDay: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        formatter.timeZone = weatherDetails.timeZone
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.string(from: Date())
    }
}

#Preview {
    dayTime(weatherDetails: WeatherModel())
}

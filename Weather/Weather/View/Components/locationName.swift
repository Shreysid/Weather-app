//
//  locationName.swift
//  Weather
//
//  Created by Shrey Sid on 04/07/24.
//

import SwiftUI

struct locationName: View {
    @ObservedObject var weatherDetails: WeatherModel
    var body: some View {
        VStack {
            Text(weatherDetails.cityName)
                .font(.largeTitle)
        }
    }
}


#Preview {
    locationName(weatherDetails: WeatherModel())
}

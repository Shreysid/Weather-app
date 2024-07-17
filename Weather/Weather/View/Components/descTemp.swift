//
//  descTemp.swift
//  Weather
//
//  Created by Shrey Sid on 04/07/24.
//

import SwiftUI

struct descTemp: View {
    @StateObject var weatherDetails = WeatherModel()
    var body: some View {
        VStack{
            let temp = String(format:"%.1f",weatherDetails.temperature)
            Text("\(temp)°C")
                .font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/) 
            Text(weatherDetails.desc)
        }
    }
}

#Preview {
    descTemp()
}

//
//  weatherImage.swift
//  Weather
//
//  Created by Shrey Sid on 04/07/24.
//

import SwiftUI

struct weatherImage: View {
    var body: some View {
        VStack{
            Image("imagePlace")
                .resizable()
                .scaledToFit()
        }
    }
}
#Preview {
    weatherImage()
}

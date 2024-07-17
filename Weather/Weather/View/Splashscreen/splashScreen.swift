//
//  splashScreen.swift
//  Weather
//
//  Created by Shrey Sid on 12/07/24.
//

import SwiftUI
import Lottie

struct splashScreen: View {
    @State private var isActive:Bool = false
    
    var body: some View {
        if isActive{
            weatherView()
        }
        
        else {
            ZStack {
                Color(.teal)
                    .ignoresSafeArea(.all)
                
                VStack {
                    LottieView(animation:.named("startLogo"))
                        .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
                        .scaledToFit()
                        .scaleEffect(1.2)
                        .font(.title)
                        .foregroundStyle(Color(.blue))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                   
                }
                .onAppear(){
                    DispatchQueue.main.asyncAfter(deadline: .now()+2.0){
                        withAnimation{
                            self.isActive = true
                        }
                    }
                }
            }
        }
        
    }
}

#Preview {
    splashScreen()
}

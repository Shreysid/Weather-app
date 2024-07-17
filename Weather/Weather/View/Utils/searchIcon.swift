//
//  searchCity.swift
//  Weather
//
//  Created by Shrey Sid on 08/07/24.
//

import SwiftUI

struct searchIcon: View {
    
    var body: some View {
        
        Circle()
            .foregroundStyle(Color(.blue))
            .opacity(0.3)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .frame(width:50,height:50)
            .overlay{
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(Color(.blue))
                    .opacity(1)
            }
    }
}


#Preview {
    searchIcon()
}

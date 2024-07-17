//
//  searchBar.swift
//  Weather
//
//  Created by Shrey Sid on 12/07/24.
//

import SwiftUI

struct searchBar: View {
    @Binding var cityName: String
    var onSubmit: () -> Void
    
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .frame(width:240,height:30)
                        .foregroundStyle(Color(.blue))
                        .opacity(0.3)
                        .overlay{ 
                            TextField("Enter city name", text: $cityName, onCommit: onSubmit)
                    .padding()
                    .foregroundStyle(Color("textColor"))
            }
           searchIcon()
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    @State static var cityName = "California"
    
    static var previews: some View {
        searchBar(cityName: $cityName, onSubmit: {
            print("Search submitted for city: \(cityName)")
        })
    }
}




//#Preview {
//    @State var cityName = "California"
//    searchBar(cityName: $cityName, onSubmit: {
//        print("Search submitted for city: \(cityName)")
//    })
//}


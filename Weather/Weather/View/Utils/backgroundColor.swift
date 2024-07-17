//
//  backgroundColor.swift
//  Weather
//
//  Created by Shrey Sid on 04/07/24.
//

import SwiftUI

struct backgroundColor: View {
    var body: some View {
        Color(UIColor(named: "backgroundColor")!)
            .ignoresSafeArea(.all)
    }
}

#Preview {
    backgroundColor()
}

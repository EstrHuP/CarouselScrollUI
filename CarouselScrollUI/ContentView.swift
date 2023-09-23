//
//  ContentView.swift
//  CarouselScrollUI
//
//  Created by EstrHuP on 23/9/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        if #available(iOS 17.0, *) {
            HomeView()
        } else {
            // Fallback on earlier versions
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

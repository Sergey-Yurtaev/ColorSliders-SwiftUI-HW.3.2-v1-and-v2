//
//  ContentView.swift
//  ColorSliders(SwiftUI)HW.3.2
//
//  Created by Sergey Yurtaev on 29.06.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var red = Double.random(in: 0...255)
    @State private var green = Double.random(in: 0...255)
    @State private var blue = Double.random(in: 0...255)
    
    var body: some View {
        ZStack {
            Color(.gray)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 10) {
                ColorView(red: red, green: green, blue: blue)
                ColorSlider(valueColor: $red, colorText: Color(.red))
                ColorSlider(valueColor: $green, colorText: Color(.green))
                ColorSlider(valueColor: $blue, colorText: Color(.blue))
                Spacer()
            }
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

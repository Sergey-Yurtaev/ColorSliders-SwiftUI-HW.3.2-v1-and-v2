//
//  ColorView.swift
//  ColorSliders(SwiftUI)HW.3.2
//
//  Created by Sergey Yurtaev on 29.06.2022.
//

import SwiftUI

struct ColorView: View {
    let red: Double
    let green: Double
    let blue: Double
    
    var body: some View {
        Color(
            red: red / 255,
            green: green / 255,
            blue: blue / 255
        )
            .frame(height: 150)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(Color.black, lineWidth: 2)
            )
            .padding()
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(red: 255, green: 155, blue: 150)
    }
}

//
//  Sliders.swift
//  ColorSliders(SwiftUI)HW.3.2
//
//  Created by Sergey Yurtaev on 29.06.2022.
//

import SwiftUI

struct ColorSlider: View {
    
    @Binding var valueColor: Double
    
    var colorText: Color
    
    @State private var showAlert = false
    @State private var textField = ""
    
    var body: some View {
        HStack {
            
            let roundedValue = "\(lround(valueColor))"
            
            Text(roundedValue).foregroundColor(colorText)
                .frame(width: 35)
            Slider(value: $valueColor, in: 0...255, step: 1)
                .colorMultiply(colorText)
            TextField(roundedValue, text: $textField,
                      onEditingChanged: { enter in
                if enter == false {
                    guard let value = Double(textField), value >= 0, value <= 255 else
                    {
                        showAlert = true;
                        textField = "";
                        return
                        
                    }
                    valueColor = value
                    textField = ""
                }
    
            })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 45)
                .keyboardType(.phonePad)
        }
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("Wrong Format!"), message: Text("Please enter value from 0 to 255"))
        })
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


struct Sliders_Previews: PreviewProvider {
    static var previews: some View {
        ColorSlider(valueColor: .constant(100), colorText: .black)
    }
}


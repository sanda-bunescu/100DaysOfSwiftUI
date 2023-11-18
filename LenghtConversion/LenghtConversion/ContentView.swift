//
//  ContentView.swift
//  LenghtConversion
//
//  Created by Sanda Bunescu on 08.08.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var initialLenght = ""
    let measurements = ["m" , "km" , "feet" , "yard" , "mile"]
    let toMeters = [1 , 1000 , 0.3048 , 0.9144 , 1609.34]
    let fromMeters = [1 , 0.001 , 3.28084 , 1.09361 , 0.000621371]
    @State private var chosenMeasurement = "m"
    @State private var chosenConvertionMeasurement = "m"
    var result: Double {
        guard let converter = Double(initialLenght) else {
            return 0
        }
        
        return converter * toMeters[measurements.firstIndex(of: chosenMeasurement) ?? 0] * fromMeters[measurements.firstIndex(of: chosenConvertionMeasurement) ?? 0]
    }
    var result2: Double {
        if let convertionValue = Double(initialLenght){
            var convertionUnit = UnitLength.meters
            switch chosenMeasurement {
            case "m":
                convertionUnit = .meters
            case "km":
                convertionUnit = .kilometers
            case "feet":
                convertionUnit = .feet
            case "yard":
                convertionUnit = .yards
            case "mile":
                convertionUnit = .miles
           default:
               return 0
            }
            let res = Measurement(value: convertionValue, unit: convertionUnit)
            var chosenConvertionUnit = UnitLength.meters
            switch(chosenConvertionMeasurement){
            case "m":
                chosenConvertionUnit = .meters
            case "km":
                chosenConvertionUnit = .kilometers
            case "feet":
                chosenConvertionUnit = .feet
            case "yard":
                chosenConvertionUnit = .yards
            case "mile":
                chosenConvertionUnit = .miles
           default:
               return 0
            }
            
            return res.converted(to: chosenConvertionUnit).value
        }
        return 0
    }
    var body: some View {
        NavigationView{
            Form {
                Section{
                    TextField("Enter lenght" , text: $initialLenght ).keyboardType(.decimalPad)
                    Picker("Measure" , selection: $chosenMeasurement){
                        ForEach(measurements , id: \.self){
                            Text($0)
                        }
                    }
                }
                Section{
                    Picker("Converted measure" , selection: $chosenConvertionMeasurement){
                        ForEach(measurements , id: \.self){
                            Text($0)
                        }
                    }
                    Text(String(format:"%.3f" ,result2))
                }
            }
            .navigationTitle("LengthConversion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

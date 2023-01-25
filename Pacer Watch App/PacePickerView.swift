//
//  PacePickerView.swift
//  Pacer Watch App
//
//  Created by Artem Martirosyan on 22.01.2023.
//

import SwiftUI

struct PacePickerView: View {
    @State private var selection: Double = 3.0
    
    var body: some View {
        VStack {
            Picker(selection: $selection) {
                ForEach(Array(stride(from: 3.0, through: 7.0, by: 0.25)), id: \.self) { pace in
                    Text(pace.paceToString)
                        .font(.title)
                }
            } label: {
                Text("Choose your pace")
                    .font(.headline)
            }

            NavigationLink(destination: DistancesView(pace: $selection)) {
                Text("To Races")
            }
        }
        
        
    }
}

extension Double {
    var paceToString: String {
        let hours = Int(self)
        let minutesInInt = "\(Int(60*self.truncatingRemainder(dividingBy: 1)))"
        let minutes = minutesInInt != "0" ? minutesInInt : "00"
        return "\(hours):\(minutes)"
    }
}

struct PacePickerView_Previews: PreviewProvider {
    static var previews: some View {
        PacePickerView()
    }
}

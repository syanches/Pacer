//
//  PacePickerView.swift
//  Pacer Watch App
//
//  Created by Artem Martirosyan on 22.01.2023.
//

import SwiftUI

struct PacePickerView: View {
    @State var selection: String = ""
    var paces = [1, 3, 5]
    
    var body: some View {
        VStack {
            Picker(selection: $selection) {
                ForEach(paces.indices) { pace in
                    Text("\(paces[pace])")
                }
            } label: {
                Text("Choose your pace")
            }
            NavigationLink(destination: DistancesView(pace: Double(selection) ?? 0.0)) {
                Text("To Races")
            }
        }
        
        
    }
}

struct PacePickerView_Previews: PreviewProvider {
    static var previews: some View {
        PacePickerView(selection: "asd")
    }
}

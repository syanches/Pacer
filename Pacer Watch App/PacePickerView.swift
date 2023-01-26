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
                ForEach(Pace.allPaces, id: \.self) { pace in
                    Text(pace.paceToString)
                        .font(.headline)
                }
            } label: {
                Text("Choose your pace")
                    .font(.headline)
            }
            NavigationLink(destination: DistancesView(pace: selection)) {
                Text("To Races")
            }
        }
    }
}

struct PacePickerView_Previews: PreviewProvider {
    static var previews: some View {
        PacePickerView()
    }
}

//
//  PickersView.swift
//  Pacer Watch App
//
//  Created by Artem Martirosyan on 27.06.2023.
//

import SwiftUI

struct RaceModeView: View {
    @State private var pace: Double = Pace.allPaces[0]
    @State private var race: Distance = Distance.allCases[0]
    
    var body: some View {
        VStack(spacing: 10) {
            Picker(selection: $pace) {
                ForEach(Pace.allPaces, id: \.self) { pace in
                    Text(pace.paceToString)
                        .font(.headline)
                }
            } label: {
                Text("Choose pace")
                    .font(.caption)
            }
            .pickerStyle(.navigationLink)
            Picker(selection: $race) {
                ForEach(Distance.allCases, id: \.self) {
                    distance in
                    Text(distance.label)
                        .font(.headline)
                        .containerBackground(.blue.gradient, for: .navigation)
                }
            } label: {
                Text("Choose race")
                    .font(.caption)
            }
            .pickerStyle(.navigationLink)
            NavigationLink(destination: SplitsView(pace: pace, distance: race)) {
                Text("To splits")
            }
        }
        .containerBackground(.blue.gradient, for: .navigation)
    }
}

#Preview {
    RaceModeView()
}

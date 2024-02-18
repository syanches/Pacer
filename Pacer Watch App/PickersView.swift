//
//  PickersView.swift
//  Pacer Watch App
//
//  Created by Artem Martirosyan on 27.06.2023.
//

import SwiftUI

struct PickersView: View {
    enum Mode {
        case race
        case training
    }
    
    @State private var pace: Double = Pace.allPaces[0]
    @State private var race: Distance = Distance.allCases[0]
    let mode: Mode
    
    var body: some View {
        VStack(spacing: 10) {
            if mode == .race {
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
            } else {
                Text("Training mode")
            }
            NavigationLink(destination: SplitsView(pace: pace, distance: race)) {
                Text("To splits")
            }
        }
        .containerBackground(.blue.gradient, for: .navigation)
    }
}

#Preview {
    PickersView(mode: .race)
}

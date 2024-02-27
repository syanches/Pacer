//
//  TrainingModeView.swift
//  Pacer Watch App
//
//  Created by Artem Martirosyan on 19.02.2024.
//

import SwiftUI

struct TrainingModeView: View {
    @State private var pace: Double = Pace.allPaces[0]
    @State private var distance: Int = Distance.allDistances[0]
    
    var body: some View {
        VStack(spacing: 10) {
            Picker(selection: $pace) {
                ForEach(Pace.allPaces, id: \.self) { pace in
                    Text(pace.paceToString)
                        .font(.headline)
                }
            } label: {
                Text("Pace")
                    .font(.caption)
            }
            .pickerStyle(.navigationLink)
            Picker(selection: $distance) {
                ForEach(Distance.allDistances, id: \.self) {
                    distance in
                    Text("\(distance)m")
                        .font(.headline)
                        .containerBackground(.blue.gradient, for: .navigation)
                }
            } label: {
                Text("Distance")
                    .font(.caption)
            }
            .pickerStyle(.navigationLink)
            NavigationLink(destination: TrainingSplitsView(pace: pace, distance: Double(distance))) {
                Text("To splits")
            }
        }
        .containerBackground(.blue.gradient, for: .navigation)
    }
}

#Preview {
    TrainingModeView()
}

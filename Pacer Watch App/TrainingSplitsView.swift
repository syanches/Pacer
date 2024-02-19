//
//  TrainingSplitsView.swift
//  Pacer Watch App
//
//  Created by Artem Martirosyan on 19.02.2024.
//

import SwiftUI

struct TrainingSplitsView: View {
    var pace: Double
    var distance: Int
    
    var totalSeconds: Int {
        Int(Double(distance/1000)*pace*60)
    }
    var secondsForOneLap: Int {
        Int((Double(totalSeconds) / Double(laps)).rounded())
    }
    
    var laps: Int {
        Int(distance / 200)
    }
    
    var body: some View {
        List {
            ForEach(1..<laps+1, id: \.self) { split in
                let seconds = split*secondsForOneLap
                HStack {
                    Text("\(split) lap")
                    Spacer()
                    Text(Pace.convertTime(fullSeconds: seconds))
                }
            }
            .containerBackground(.blue.gradient, for: .navigation)
        }
        .navigationTitle("Race Splits")
        .environment(\.defaultMinListRowHeight, 40)
    }
}

#Preview {
//    TrainingSplitsView(pace: Pace.allPaces.randomElement()!, distance: Distance.allDistances.randomElement()!)
    TrainingSplitsView(pace: 4, distance: 1100)
}

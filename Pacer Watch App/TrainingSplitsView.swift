//
//  TrainingSplitsView.swift
//  Pacer Watch App
//
//  Created by Artem Martirosyan on 19.02.2024.
//

import SwiftUI

struct TrainingSplitsView: View {
    var pace: Double
    var distance: Double
    
    var totalSeconds: Double {
        distance/1000*pace*60
    }
    
    var secondsForOneLap: Double {
        (totalSeconds / laps)
    }
    
    var laps: Double {
        distance / 200
    }
    
    var extendedSplits: Bool {
        distance.truncatingRemainder(dividingBy: 200) != 0
    }
    
    var body: some View {
        List {
            ForEach(1..<Int(laps)+1, id: \.self) { split in
                let seconds = split*Int(secondsForOneLap)
                HStack {
                    Text("\(split) lap")
                    Spacer()
                    Text(Pace.convertTime(fullSeconds: seconds))
                }
            }
            .containerBackground(.blue.gradient, for: .navigation)
            if extendedSplits {
                HStack {
                    Text("Finish")
                    Spacer()
                    Text(Pace.convertTime(fullSeconds: Int(totalSeconds)))
                }
            }
        }
        .navigationTitle("Race Splits")
        .environment(\.defaultMinListRowHeight, 40)
    }
}

#Preview {
    TrainingSplitsView(pace: Pace.allPaces.randomElement()!, distance: Double(Distance.allDistances.randomElement()!))
}

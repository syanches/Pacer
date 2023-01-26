//
//  PacesView.swift
//  Pacer Watch App
//
//  Created by Artem Martirosyan on 22.01.2023.
//

import SwiftUI

struct SplitsView: View {
    var pace: Double
    var distance: Distance
    
    var totalSeconds: Int {
        Int(distance.rawValue*pace*60)
    }
    var secondsForOneKm: Int {
        Int((Double(totalSeconds) / distance.rawValue).rounded())
    }
    
    var body: some View {
        List {
            ForEach(1..<Int(distance.rawValue)+1, id: \.self) { split in
                let seconds = split*secondsForOneKm
                HStack {
                    Text("\(split)km")
                    Spacer()
                    Text(Pace.convertTime(fullSeconds: seconds))
                }
            }
            if distance.extendedSplits {
                HStack {
                    Text("Finish")
                    Spacer()
                    Text(Pace.convertTime(fullSeconds: totalSeconds))
                }
            }
        }
        .navigationTitle("Race Splits")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct PacesView_Previews: PreviewProvider {
    static var previews: some View {
        SplitsView(pace: 5.0, distance: .half)
    }
}

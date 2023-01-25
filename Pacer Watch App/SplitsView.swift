//
//  PacesView.swift
//  Pacer Watch App
//
//  Created by Artem Martirosyan on 22.01.2023.
//

import SwiftUI

struct SplitsView: View {
    
    private static func convertTime(fullSeconds: Int) -> String {
        let hours = fullSeconds / 3600
        let minutes = (fullSeconds % 3600) / 60
        let seconds = (fullSeconds % 3600) % 60
        
        let dateString = "\(hours):\(minutes):\(seconds)"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        
        if let dateObj = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = hours > 0 ? "HH:mm:ss" : "mm:ss"
            let string = dateFormatter.string(from: dateObj)
            return string
        }
        return ""
    }
    
    var pace: Double
    var distance: Distance
    
    var totalSeconds: Int {
        Int(distance.KMs*pace*60)
    }
    
    var secondsForOneKm: Int {
        Int((Double(totalSeconds) / distance.KMs).rounded())
    }
    
    var body: some View {
        List {
            ForEach(1..<Int(distance.KMs)+1, id: \.self) { split in
                let seconds = split*secondsForOneKm
                HStack {
                    Text("\(split)km")
                    Spacer()
                    Text(SplitsView.convertTime(fullSeconds: seconds))
                }
            }
            if distance.extendedSplits {
                HStack {
                    Text("Finish")
                    Spacer()
                    Text(SplitsView.convertTime(fullSeconds: totalSeconds))
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

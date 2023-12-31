//
//  DistancesView.swift
//  Pacer Watch App
//
//  Created by Artem Martirosyan on 22.01.2023.
//

import SwiftUI

struct DistancesView: View {
    @State var selection: Distance = Distance.allCases[0]
    var pace: Double
    
    var body: some View {
        VStack {
            Picker(selection: $selection) {
                ForEach(Distance.allCases) { distance in
                    Text(distance.label)
                        .font(.headline)
                        .tag(distance)
                }
            } label: {
                Text("Pick Race")
                    .font(.headline)
            }
            NavigationLink(destination: SplitsView(pace: pace, distance: selection)) {
                Text("To Splits")
            }
        }
    }
}

#Preview {
    DistancesView(pace: Pace.allPaces.randomElement()!)
}

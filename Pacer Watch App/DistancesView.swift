//
//  DistancesView.swift
//  Pacer Watch App
//
//  Created by Artem Martirosyan on 22.01.2023.
//

import SwiftUI

struct DistancesView: View {
    var pace: Double
    
    var body: some View {
        VStack {
            HStack {
                NavigationLink(destination: PacesView(pace: pace, distance: .fiveK)) {
                    DistanceView(distance: .fiveK)
                }
                NavigationLink(destination: {}) {
                    DistanceView(distance: .tenK)
                }
            }
            HStack {
                NavigationLink(destination: {}) {
                    DistanceView(distance: .half)
                }
                NavigationLink(destination: {}) {
                    DistanceView(distance: .marathon)
                }
            }
        }
        .navigationTitle("Choose race")
    }
}

struct DistancesView_Previews: PreviewProvider {
    static var previews: some View {
        DistancesView(pace: 5.0)
    }
}

//
//  DistancesView.swift
//  Pacer Watch App
//
//  Created by Artem Martirosyan on 22.01.2023.
//

import SwiftUI

struct DistancesView: View {
    @State var selection: Distance = .fiveK
    @Binding var pace: Double
    
    var body: some View {
        VStack {
            Picker(selection: $selection) {
                ForEach(Distance.allCases) { distance in
                    Text(distance.rawValue)
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

struct DistancesView_Previews: PreviewProvider {
    static var previews: some View {
        DistancesView(pace: .constant(5.0))
    }
}

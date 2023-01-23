//
//  PacesView.swift
//  Pacer Watch App
//
//  Created by Artem Martirosyan on 22.01.2023.
//

import SwiftUI

struct PacesView: View {
    var pace: Double
    var distance: Distance
    
    var body: some View {
        List {
            ForEach(0..<distance.splits) { split in
                Text("split")
            }
        }
    }
}

struct PacesView_Previews: PreviewProvider {
    static var previews: some View {
        PacesView(pace: 5.0, distance: .half)
    }
}

//
//  DistanceView.swift
//  Pacer Watch App
//
//  Created by Artem Martirosyan on 22.01.2023.
//

import SwiftUI

struct DistanceView: View {
    var distance: Distance
    
    var body: some View {
        Text("\(distance.rawValue)")
    }
}

struct DistanceView_Previews: PreviewProvider {
    static var previews: some View {
        DistanceView(distance: .fiveK)
    }
}

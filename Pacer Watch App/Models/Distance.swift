//
//  Distance.swift
//  Pacer Watch App
//
//  Created by Artem Martirosyan on 22.01.2023.
//

import Foundation

enum Distance: Double, CaseIterable, Identifiable {
    case threeK = 3
    case fiveK = 5
    case tenK = 10
    case half = 21.1
    case marathon = 42.2
    
    var id: Int {
        Int(rawValue)
    }
}

extension Distance {
    var extendedSplits: Bool {
        Double(Int(rawValue)) != rawValue
    }
    
    var label: String {
        extendedSplits ? "\(rawValue)K" : "\(Int(rawValue))K"
    }
}

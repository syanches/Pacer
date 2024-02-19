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
    
    static private var minDistance = 200
    static private var maxDistance = 2000
    static private var distanceDiff = 100
    
    static var allDistances: Array<Int> {
        Array(stride(from: minDistance, through: maxDistance, by: distanceDiff))
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

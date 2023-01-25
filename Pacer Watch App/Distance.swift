//
//  Distance.swift
//  Pacer Watch App
//
//  Created by Artem Martirosyan on 22.01.2023.
//

import Foundation

enum Distance: String, CaseIterable, Identifiable {
    var id: Int {
        Int(KMs)
    }
    
    case fiveK = "5K"
    case tenK = "10K"
    case half = "21.1K"
    case marathon = "42.2K"
}

extension Distance {
    var KMs: Double {
        switch self {
        case .fiveK:
            return 5.0
        case .tenK:
            return 10.0
        case .half:
            return 21.1
        case .marathon:
            return 42.2
        }
    }
    
    var extendedSplits: Bool {
        switch self {
        case .fiveK, .tenK:
            return false
        case .half, .marathon:
            return true
        }
    }
}

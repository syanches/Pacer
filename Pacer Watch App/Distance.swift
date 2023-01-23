//
//  Distance.swift
//  Pacer Watch App
//
//  Created by Artem Martirosyan on 22.01.2023.
//

import Foundation

enum Distance: String {
    case fiveK = "5K"
    case tenK = "10K"
    case half = "21.1K"
    case marathon = "42.2K"
}

extension Distance {
    var splits: Int {
        switch self {
        case .fiveK:
            return 5
        case .tenK:
            return 10
        case .half:
            return 22
        case .marathon:
            return 43
        }

    }
}

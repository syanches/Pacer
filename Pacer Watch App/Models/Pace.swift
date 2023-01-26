//
//  Pace.swift
//  Pacer Watch App
//
//  Created by Artem Martirosyan on 26.01.2023.
//

import Foundation

struct Pace {
    static private var fastestPace = 3.0
    static private var slowestPace = 7.0
    static private var paceDiff = 0.25
    
    static var allPaces: Array<Double> {
        Array(stride(from: fastestPace, through: slowestPace, by: paceDiff))
    }
    
    static func convertTime(fullSeconds: Int) -> String {
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
}

extension Double {
    var paceToString: String {
        let minutes = Int(self)
        let secondsInInt = "\(Int(60*self.truncatingRemainder(dividingBy: 1)))"
        let seconds = secondsInInt != "0" ? secondsInInt : "00"
        return "\(minutes):\(seconds)"
    }
}
